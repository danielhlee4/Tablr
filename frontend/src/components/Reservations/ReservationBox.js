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
    // const [time, setTime] = useState('');
    const [showTimes, setShowTimes] = useState(false);
    const [error, setError] = useState(null);

    const times = []; 
    for(let i=11; i<=22; i++) { // Generate times from 11 AM to 10 PM in 30-minute intervals
        times.push(`${i%12 || 12}:00 ${i<12 ? 'AM' : 'PM'}`);
        times.push(`${i%12 || 12}:30 ${i<12 ? 'AM' : 'PM'}`);
    }

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
        setShowTimes(true);
    }

    const handleTimeClick = (selectedTime) => {
        const reservationDetails = {
            partySize: parseInt(partySize.split(' ')[0]), // Convert '1 person' to 1
            date: date,
            time: convertTo24HourFormat(selectedTime),
            restaurantId
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
            <button onClick={handleSubmit}>Find a time</button>

            {showTimes && (
                <div className="available-times">
                    {times.map((t, index) => (
                        <button key={index} onClick={() => handleTimeClick(t)}>{t}</button>
                    ))}
                </div>
            )}
        </div>
    );
}

export default ReservationBox;
