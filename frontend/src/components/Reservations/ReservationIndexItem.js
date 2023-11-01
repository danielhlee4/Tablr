import { adjustForDST } from '../../util/timeUtils';
import badroman from '../../assets/badroman.webp'
import './Reservations.css';

function ReservationIndexItem({ reservation }) {
    
    function isPastReservation(dateStr, timeStr) {
        const combinedDate = adjustForDST(dateStr, timeStr);
        const now = new Date();
        return combinedDate < now;
    }
    
    function formatDateAndTime(dateStr, timeStr) {
        const adjustedDate = adjustForDST(dateStr, timeStr);
        const formattedDate = isPastReservation(dateStr, timeStr) ?
            adjustedDate.toLocaleDateString('en-US', { month: 'short', day: 'numeric' }) :
            adjustedDate.toLocaleDateString('en-US', { weekday: 'short', month: 'short', day: 'numeric' });
    
        const formattedTime = adjustedDate.toLocaleTimeString('en-US', { hour: '2-digit', minute: '2-digit', hour12: true });
        
        if (isPastReservation(dateStr, timeStr)) {
            const currentYear = new Date().getFullYear();
            const reservationYear = adjustedDate.getFullYear();
            return `${formattedDate}${currentYear !== reservationYear ? `, ${reservationYear}` : ''}`;
        }
        
        return `${formattedDate} at ${formattedTime}`;
    }
    

    return (
        <div className="index-item-reservations-container">
            <img 
                src={badroman}
                alt={`Image of ${reservation.restaurant.name}`} 
                className="index-item-reservation-image"
            />
            <div className="index-item-reservation-details">
                <div className="index-item-reservation-name">{reservation.restaurant.name}</div>
                <div className={`index-item-reservation-status ${isPastReservation(reservation.date, reservation.time) ? '' : 'index-item-reservation-status-confirmed'}`}>
                    {isPastReservation(reservation.date, reservation.time) ? 'Reservation completed' : 'Reservation confirmed'}
                </div>
                <div className="index-item-reservation-info">
                    <span>{reservation.partySize} &bull; {formatDateAndTime(reservation.date, reservation.time)}</span>
                </div>
                <div>
                    {isPastReservation(reservation.date, reservation.time) ? 
                        <button className="index-item-reservation-action">Leave a review</button> : 
                        <>
                            <button className="index-item-reservation-action">Modify</button>
                            <button className="index-item-reservation-action">Cancel</button>
                        </>
                    }
                </div>
            </div>
        </div>
    );
};

export default ReservationIndexItem;
