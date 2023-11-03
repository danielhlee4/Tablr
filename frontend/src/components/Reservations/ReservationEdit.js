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
        <>
            <div className="edit-current-reservation-details">
                <img 
                    // src={reservation.photoUrl} 
                    src={badroman}
                    alt={`Image of ${reservation.restaurant.name}`} 
                />
                <span>{reservation.restaurant.name}</span>
                <span>{formatDateAndTime(reservation.date, reservation.time)}</span>
                <span>{reservation.partySize} people</span>
            </div>
            <ReservationBox />
        </>
    )
};

export default ReservationEdit;