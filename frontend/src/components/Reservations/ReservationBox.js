import React, { useState, useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { useParams, useLocation, useHistory } from 'react-router-dom';
import { createReservation, updateReservation, fetchReservation, getReservationCreationError } from '../../store/reservations';
import { convertTo12HourFormat, extractTimeFromISOString } from '../../util/timeUtils';
import './Reservations.css';

function ReservationBox() {
    const dispatch = useDispatch();
    const location = useLocation();
    const { restaurantId, userId, reservationId } = useParams();
    const currentUser = useSelector(state => state.session.user);
    const [partySize, setPartySize] = useState('2');
    const [times, setTimes] = useState('');
    const [showTimes, setShowTimes] = useState(false);
    const [error, setError] = useState(null);
    const currentDate = new Date().toISOString().split('T')[0];
    const [date, setDate] = useState(currentDate);
    const timeOptions = generateTimes();
    const [selectedTimeSlot, setSelectedTimeSlot] = useState(null);
    const reservationCreationError = useSelector(getReservationCreationError);
    const history = useHistory();
    const isEditMode = location.pathname.includes('/edit');
    const [fetchedRestaurantId, setFetchedRestaurantId] = useState(null);

    useEffect(() => {
        if (isEditMode) {
            dispatch(fetchReservation(reservationId))
                .then(data => {
                    if (data) {
                        setPartySize(data.partySize.toString());
                        setDate(data.date);
                        setTime(extractTimeFromISOString(data.time));
                        setFetchedRestaurantId(data.restaurant.id);
                    }
                })
                .catch(error => {
                    console.error('Error fetching reservation:', error);
                });
        }
    }, [isEditMode, dispatch, reservationId]);

    const effectiveRestaurantId = isEditMode ? fetchedRestaurantId : restaurantId;

    // Set default time value to next half hour increment
    const calculateRoundedUpTime = () => {
        const now = new Date();
        let hours = now.getHours();
        let minutes = now.getMinutes();

        if (minutes < 30) {
            minutes = 30;
        } else {
            minutes = 0;
            hours += 1;
        }

        const hoursString = hours.toString().padStart(2, '0');
        const minutesString = minutes.toString().padStart(2, '0');
        
        return `${hoursString}:${minutesString}`;
    };

    const [time, setTime] = useState(calculateRoundedUpTime);

    // Recalculate the time if the component is still mounted after a half-hour
    useEffect(() => {
        if (isEditMode) return;

        const now = new Date();
        const minutesToNextHalfHour = 30 - (now.getMinutes() % 30);
        const msToNextHalfHour = minutesToNextHalfHour * 60 * 1000;

        const timeoutId = setTimeout(() => {
            setTime(calculateRoundedUpTime());
        }, msToNextHalfHour);

        // Cleanup function to clear the timeout if the component unmounts
        return () => clearTimeout(timeoutId);
    }, []);

    const convertTo24HourFormat = (time) => {
        const [hour, minute, period] = time.split(/[:\s]/);
        let h = parseInt(hour);
        if (period === "PM" && h < 12) h += 12;
        if (period === "AM" && h === 12) h -= 12;
        return `${h.toString().padStart(2, '0')}:${minute}:00`;
    };

    function isValidTime(selectedTime) {
        const closingTime = 22; // 10 PM
        const openingTime = 11; // 11 AM
      
        // Convert selected time to a 24-hour format number.
        const timeParts = selectedTime.split(':');
        const hour = parseInt(timeParts[0], 10);
      
        return hour >= openingTime && hour < closingTime;
    }

    // Generate up to five reservation times when clicking 'find a time'
    function generateSurroundingTimes(selectedTime) {
        const interval = 30;
        let times = [];
      
        // Convert selected time to minutes.
        let [hours, minutes] = selectedTime.split(':').map(num => parseInt(num, 10));
        let selectedTimeInMinutes = hours * 60 + minutes;
      
        // Generate times
        for (let i = -2; i <= 2; i++) {
          let currentTimeInMinutes = selectedTimeInMinutes + i * interval;
          let currentHours = Math.floor(currentTimeInMinutes / 60);
          let currentMinutes = currentTimeInMinutes % 60;
      
          // Convert back to a time format
          let timeString = 
            currentHours.toString().padStart(2, '0') + ':' + 
            currentMinutes.toString().padStart(2, '0');
      
          // Validate and add to array
          if (isValidTime(timeString)) {
            times.push(timeString);
          }
        }
      
        return times;
    }

    // For time input
    function generateTimes() {
        let times = [];
        for (let i = 11; i <= 21; i++) { 
            let hour = i > 12 ? i - 12 : i;
            let period = i < 12 || i === 24 ? 'AM' : 'PM';
            times.push(`${hour}:00 ${period}`);
            times.push(`${hour}:30 ${period}`);
        }
        return times;
    }
    

    const handleTimeClick = (selectedTime) => {
        setSelectedTimeSlot(selectedTime);
    }

    const handleConfirmClick = async () => {
        const numberOfPeople = parseInt(partySize.split(' ')[0]); // Convert '1 person' to 1
        const reservationDetails = {
            reservation: {
                partySize: numberOfPeople,
                date: date,
                time: convertTo24HourFormat(selectedTimeSlot),
                restaurantId: effectiveRestaurantId
            }
        };
        
        let response;
        if (isEditMode) {
            reservationDetails.id = reservationId;
            response = await dispatch(updateReservation(reservationDetails));
        } else {
            response = await dispatch(createReservation(reservationDetails));
        }
    
        if (response && response.ok) {
            history.push(`/users/${currentUser.id}/reservations`);
        } else if (response) {
            const errorData = await response.json();
            if (errorData.error) {
                setError(errorData.message);
            }
        } else {
            setError("This time conflicts with another current reservation or is in the past"); 
        }
    
        setShowTimes(false);
        setSelectedTimeSlot(null);
    };
    

    const handleSubmit = () => {
        if (!currentUser) {
            setError("Please log in to make a reservation.");
            return;
        }
        setError(null);

        if (!time) {
            setError("Please specify a time.");
            return;
        }

        const time24 = convertTo24HourFormat(time);
        const availableTimes = generateSurroundingTimes(time24);
        setTimes(availableTimes); 
        setShowTimes(true);
    }

    // When restaurant index reservation time is clicked
    useEffect(() => {
        if (location.state && location.state.selectedTime) {
            // Set the time
            setTime(location.state.selectedTime);
    
            // Click "find a time"
            handleSubmit();
    
            // Click on the specified time
            handleTimeClick(location.state.selectedTime);
        }
    }, [location]);

    return (
        <div className={isEditMode ? "reservation-edit-container" : "reservation-box-container"}>
            <h2 className={isEditMode ? "reservation-edit-heading" : "reservation-box-heading"}>
                {isEditMode ? 'Modify Reservation' : 'Make a Reservation'}
            </h2>
            {error && <div className={isEditMode ? "edit-error-message" : "error-message"}>{error}</div>}
            <label className={isEditMode ? "reservation-edit-label" : "reservation-box-label"}>
                Party Size
                <select value={partySize} onChange={e => {
                    setPartySize(e.target.value);
                    setSelectedTimeSlot(null);
                }}>
                    {[...Array(11)].map((_, i) => {
                        const value = (i + 1).toString();
                        const label = i + 1 === 1 ? 'person' : 'people';
                        return (
                            <option key={i} value={value}>
                                {`${i + 1} ${label}`}
                            </option>
                        );
                    })}
                </select>
            </label>
            
            <div className={isEditMode ? "edit-date-time-container" : "date-time-container"}>
                <label className={isEditMode ? "reservation-edit-label date-edit-label" : "reservation-box-label date-label"}>
                    Date
                    <input type="date" min={new Date().toISOString().split('T')[0]} value={date} onChange={e => {
                        setDate(e.target.value);
                        setSelectedTimeSlot(null);
                    }} />
                </label>
                
                <label className={isEditMode ? "reservation-edit-label time-edit-label" : "reservation-box-label time-label"}>
                    Time
                    <select 
                        value={convertTo12HourFormat(time)} 
                        onChange={e => {
                            // Convert the selected value (like "3:00 PM") back to 24-hour format (like "15:00") before setting the state
                            const timeIn24HourFormat = convertTo24HourFormat(e.target.value);
                            setTime(timeIn24HourFormat);
                            setSelectedTimeSlot(null);
                        }}
                    >
                        {timeOptions.map((t, idx) => (
                            <option key={idx} value={t}>{t}</option>
                        ))}
                    </select>
                </label>
            </div>

            <button 
                className={isEditMode ? "reservation-edit-find-time-btn" : "reservation-box-find-time-btn"} 
                onClick={handleSubmit}>
                {isEditMode ? 'Find a new table' : 'Find a time'}
            </button>

            {showTimes && (
                <div className={isEditMode ? "reservation-edit-available-times" : "reservation-box-available-times"}>
                    {times.map((t, index) => {
                        // Convert 't' from "HH:mm" to 12-hour format with AM/PM
                        const [hour, minute] = t.split(':');
                        const hourIn12 = (parseInt(hour) % 12) || 12;
                        const period = parseInt(hour) >= 12 ? 'PM' : 'AM';

                        return (
                            <button 
                                key={index} 
                                onClick={() => handleTimeClick(t)}>
                                {`${hourIn12}:${minute} ${period}`}
                            </button>
                        );
                    })}
                </div>
            )}

            {currentUser && selectedTimeSlot && (
                <button className={isEditMode ? "reservation-edit-confirm-btn" : "reservation-box-confirm-btn"} onClick={handleConfirmClick}>
                    {isEditMode ? 'Modify Reservation' : 'Confirm Reservation'}
                </button>
            )}
        </div>
    );
}

export default ReservationBox;