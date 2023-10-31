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

    console.log('All reservations', reservations);

    console.log('userid', userId)

    useEffect(() => {
        if (!reservations.length) {
          dispatch(fetchReservations());
        }
    }, [dispatch]);

    const userReservations = reservations.filter(reservation => reservation.user.id.toString() === userId);
    console.log(userReservations)

    return (
        <div className="index-reservations-container">
            {userReservations.map(reservation => (
                <ReservationIndexItem key={reservation.id} reservation={reservation} />
            ))}
        </div>
    )

};

export default ReservationIndex;