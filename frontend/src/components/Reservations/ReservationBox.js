import React, { useState, useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { useParams } from 'react-router-dom';
import { createReservation } from '../../store/reservations';
import './Reservations.css';

function ReservationBox() {
    const dispatch = useDispatch();
    const { restaurantId } = useParams();
    const currentUser = useSelector(state => state.session.user);
    
    const [partySize, setPartySize] = useState('2');
    const [times, setTimes] = useState('');
    const [showTimes, setShowTimes] = useState(false);
    const [error, setError] = useState(null);
    
    const currentDate = new Date().toISOString().split('T')[0];
    const [date, setDate] = useState(currentDate);
    // Set default time value to next hour or half hour 
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

        const time24 = time + ":00";
        const availableTimes = generateSurroundingTimes(time24);
        setTimes(availableTimes); 
        setShowTimes(true);
    }

    function isValidTime(selectedTime) {
        const closingTime = 22; // 10 PM
        const openingTime = 11; // 11 AM
      
        // Convert selected time to a 24-hour format number.
        const timeParts = selectedTime.split(':');
        const hour = parseInt(timeParts[0], 10);
      
        return hour >= openingTime && hour < closingTime;
    }

    // Generate up to five reservation times
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

    const handleTimeClick = (selectedTime) => {
        setTime(selectedTime);
        const numberOfPeople = parseInt(partySize.split(' ')[0]); // Convert '1 person' to 1
        const reservationDetails = {
            reservation: {
                partySize: numberOfPeople,
                date: date,
                time: convertTo24HourFormat(selectedTime),
                restaurantId: restaurantId
            }
        };
        dispatch(createReservation(reservationDetails));
        setShowTimes(false);
    }

    return (
        <div className="reservation-box-container">
            <h2>Make a reservation</h2>
            {error && <div className="error-message">{error}</div>}
            <label>
                Party Size:
                <select value={partySize} onChange={e => setPartySize(e.target.value)}>
                    {[...Array(11)].map((_, i) => {
                        // Set default value to 2 persons which is a string number '2'
                        const value = (i + 1).toString();
                        return (
                            <option key={i} value={value}>
                                {`${i + 1} person${i > 0 ? 's' : ''}`}
                            </option>
                        );
                    })}
                </select>
            </label>
            <br />
            <label>
                Date:
                <input type="date" min={new Date().toISOString().split('T')[0]} value={date} onChange={e => setDate(e.target.value)} />
            </label>
            <br />
            <label>
                Time:
                <input type="time" value={time} onChange={e => setTime(e.target.value)} />
            </label>
            <br />
            <button onClick={handleSubmit}>Find a time</button>

            {showTimes && (
                <div className="available-times">
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
        </div>
    );
}

export default ReservationBox;
