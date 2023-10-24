import React, { useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { useParams } from 'react-router-dom';
import { createReservation } from '../../store/reservations';
import './Reservations.css';

function ReservationBox() {
    const dispatch = useDispatch();
    const { restaurantId } = useParams();
    const currentUser = useSelector(state => state.session.user);
    
    const [partySize, setPartySize] = useState('1 person');
    const [date, setDate] = useState('');
    const [time, setTime] = useState('');
    const [times, setTimes] = useState('');
    const [showTimes, setShowTimes] = useState(false);
    const [error, setError] = useState(null);

    // const times = []; 
    // for(let i=11; i<=22; i++) { // Generate times from 11 AM to 10 PM in 30-minute intervals
    //     times.push(`${i%12 || 12}:00 ${i<12 ? 'AM' : 'PM'}`);
    //     times.push(`${i%12 || 12}:30 ${i<12 ? 'AM' : 'PM'}`);
    // }

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
        const openingTime = 9; // 9 AM
      
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
                    {[...Array(11)].map((_, i) => 
                        <option key={i} value={`${i+1} person`}>{`${i+1} person${i > 0 ? 's' : ''}`}</option>
                    )}
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
                                {`${hourIn12}:${minute} ${period}`} {/* Display in 12-hour format */}
                            </button>
                        );
                    })}
                </div>
            )}
        </div>
    );
}

export default ReservationBox;
