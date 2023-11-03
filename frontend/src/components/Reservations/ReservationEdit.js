import { useSelector } from 'react-redux';
import { useParams } from 'react-router-dom';
import { getReservation } from "../../store/reservations";
import { formatDateAndTime } from "../../util/timeUtils";
import badroman from "../../assets/badroman.webp";
import ReservationBox from "./ReservationBox";

function ReservationEdit() {
    const { reservationId } = useParams();
    const reservation = useSelector(state => getReservation(reservationId)(state));

    if (!reservation) {
        return <p>Loading...</p>;
    }

    return(
        <div className="edit-reservation-page-container">
            <div className="edit-current-reservation-container">
                <h2 className="edit-current-reservation-title">Your current reservation</h2>
                <img 
                    // src={reservation.restaurant.photoUrl} 
                    src={badroman}
                    alt={`Image of ${reservation.restaurant.name}`} 
                />
                <h3 className="edit-current-reservation-name">{reservation.restaurant.name}</h3>
                <div className="edit-current-reservation-details">
                    <span className="edit-reservation-icon">
                        <i className="fa-sharp fa-light fa-calendar"></i>
                    </span>
                    <span>{formatDateAndTime(reservation.date, reservation.time)}</span>
                    <span className="edit-reservation-icon">
                        <i className="fa-light fa-user-group"></i>
                    </span>
                    <span>{reservation.partySize} people</span>
                </div>
            </div>
            <ReservationBox />
        </div>
    )
};

export default ReservationEdit;