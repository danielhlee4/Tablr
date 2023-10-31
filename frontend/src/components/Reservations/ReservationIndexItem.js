import badroman from '../../assets/badroman.webp'
import './Reservations.css';

function ReservationIndexItem({ reservation }) {
    function formatDateAndTime(dateStr, timeStr) {
        // Extract the hour, minute, and second from the timeStr
        const [_, hours, minutes, seconds] = timeStr.match(/(\d{2}):(\d{2}):(\d{2})/);
    
        // Combine dateStr with extracted hours, minutes, and seconds, then convert to Date object
        const combinedDate = new Date(`${dateStr}T${hours}:${minutes}:${seconds}`);
    
        const formattedDate = combinedDate.toLocaleDateString('en-US', { weekday: 'short', month: 'short', day: 'numeric' });
        const formattedTime = combinedDate.toLocaleTimeString('en-US', { hour: '2-digit', minute: '2-digit', hour12: true });
    
        return `${formattedDate} at ${formattedTime}`;
    }
    
    return (
        <div className="index-item-reservations-container">
            <img 
                // src={reservation.restaurant.photoUrl} 
                src={badroman}
                alt={`Image of ${reservation.restaurant.name}`} 
                className="index-item-reservation-image"
            />
            <div className="index-item-reservation-details">
                <div className="index-item-reservation-name">{reservation.restaurant.name}</div>
                <div className="index-item-reservation-status">Reservation confirmed</div>
                <div className="index-item-reservation-info">
                    <span>{reservation.partySize} &bull; {formatDateAndTime(reservation.date, reservation.time)}</span>
                </div>
                <div>
                    <button className="index-item-reservation-action">Modify</button>
                    <button className="index-item-reservation-action">Cancel</button>
                </div>
            </div>
        </div>
    );
};

export default ReservationIndexItem;
