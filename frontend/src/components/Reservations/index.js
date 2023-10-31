import { useEffect } from 'react';
import { useSelector, useDispatch } from 'react-redux';
import { useParams } from 'react-router-dom';
import { fetchReservations, getReservations } from '../../store/reservations';
import ReservationIndexItem from './ReservationIndexItem';
import './Reservations.css';

function ReservationIndex() {
    const dispatch = useDispatch();
    const { userId } = useParams();
    const reservations = useSelector(getReservations);

    useEffect(() => {
        if (!reservations.length) {
          dispatch(fetchReservations());
        }
    }, [dispatch]);

    const userReservations = reservations.filter(reservation => reservation.user.id.toString() === userId);

    const sortedUserReservations = userReservations.sort((a, b) => {
        const datetimeA = new Date(a.date + 'T' + a.time.slice(11,19));
        const datetimeB = new Date(b.date + 'T' + b.time.slice(11,19));
        return datetimeB - datetimeA;
    });

    const currentDate = new Date();

    const upcomingReservations = sortedUserReservations.filter(reservation => {
        const reservationDate = new Date(reservation.date);
        return reservationDate >= currentDate;
    });

    const pastReservations = sortedUserReservations.filter(reservation => {
        const reservationDate = new Date(reservation.date);
        return reservationDate < currentDate;
    });

    return (
        <div className="index-reservations-wrapper">
            
            <div className="index-upcoming-reservations-container">
                <h2 className="index-reservations-title">Upcoming reservations</h2>
                {upcomingReservations.map(reservation => (
                    <ReservationIndexItem key={reservation.id} reservation={reservation} />
                ))}
            </div>
            
            <div className="index-past-reservations-container">
                <h2 className="index-reservations-title">Past reservations</h2>
                {pastReservations.map(reservation => (
                    <ReservationIndexItem key={reservation.id} reservation={reservation} />
                ))}
            </div>
    
        </div>
    );

};

export default ReservationIndex;