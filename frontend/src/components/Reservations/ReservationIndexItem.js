import { Link, useHistory } from 'react-router-dom';
import { adjustForDST } from '../../util/timeUtils';
import badroman from '../../assets/badroman.webp'
import { useDispatch } from 'react-redux';
import { deleteReservation } from '../../store/reservations';
import { formatDateAndTime, isPastReservation } from '../../util/timeUtils';
import './Reservations.css';

function ReservationIndexItem({ reservation }) {
    const dispatch = useDispatch();
    const history = useHistory();

    const handleCancel = async () => {
        const confirmed = window.confirm("Are you sure you want to cancel this reservation?");
        if (confirmed) {
            await dispatch(deleteReservation(reservation.id));
        }
    };

    const handleModify = () => {
        history.push(`/users/${reservation.user.id}/reservations/${reservation.id}/edit`);
    };

    const handleLeaveReview = () => {
        history.push(`/users/${reservation.user.id}/reservations/${reservation.id}/review/new`);
    };

    return (
        <div className="index-item-reservations-container">
            <Link to={`/restaurants/${reservation.restaurant.id}`}>
                <img
                    src={reservation.restaurant.photoUrl} 
                    // src={badroman}
                    alt={`Image of ${reservation.restaurant.name}`} 
                    className="index-item-reservation-image"
                />
            </Link>
            <div className="index-item-reservation-details">
                <Link to={`/restaurants/${reservation.restaurant.id}`} className="index-item-reservation-name">
                    {reservation.restaurant.name}
                </Link>
                <div className={`index-item-reservation-status ${isPastReservation(reservation.date, reservation.time) ? '' : 'index-item-reservation-status-confirmed'}`}>
                    {isPastReservation(reservation.date, reservation.time) ? 
                        <span>
                            <span className="index-item-reservation-icon-wrapper"><i className="fa-sharp fa-light fa-square-check"></i></span>
                            <span className="index-item-reservation-text-wrapper">Reservation completed</span>
                        </span> 
                        : 
                        'Reservation confirmed'
                    }
                </div>
                <div className="index-item-reservation-info">
                    <span className="index-reservation-icon">
                        <i className="fa-light fa-user-group"></i>
                    </span>
                    <span className="index-reservation-party-size">
                        {reservation.partySize}
                    </span>
                    <span className="index-reservation-icon">
                        <i className="fa-sharp fa-light fa-calendar"></i>
                    </span>
                    <span className="index-reservation-date-time">
                        {formatDateAndTime(reservation.date, reservation.time)}
                    </span>
                </div>

                <div>
                    {isPastReservation(reservation.date, reservation.time) ? 
                        <button className="index-item-reservation-action" onClick={handleLeaveReview}>Leave a review</button> : 
                        <>
                            <button className="index-item-reservation-action" onClick={handleModify}>Modify</button>
                            <button className="index-item-reservation-action" onClick={handleCancel}>Cancel</button>
                        </>
                    }
                </div>
            </div>
        </div>
    );
};

export default ReservationIndexItem;
