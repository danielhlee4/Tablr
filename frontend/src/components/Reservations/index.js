import { useEffect, useState } from 'react';
import { useSelector, useDispatch } from 'react-redux';
import { useParams } from 'react-router-dom';
import { fetchReservations, getReservations } from '../../store/reservations';
import ReservationIndexItem from './ReservationIndexItem';
import './Reservations.css';

function ReservationIndex() {
    const dispatch = useDispatch();
    const { userId } = useParams();
    const reservations = useSelector(getReservations);
    const currentUser = useSelector(state => state.session.user);
    const [isLoading, setIsLoading] = useState(false);

    useEffect(() => {
        setIsLoading(true);
        dispatch(fetchReservations()).then(() => setIsLoading(false));
    }, [dispatch]);

    const userReservations = (reservations || []).filter(reservation => reservation && reservation.user && reservation.user.id.toString() === userId);

    const sortedUserReservations = userReservations.sort((a, b) => {
        const datetimeA = new Date(a.date + 'T' + a.time.slice(11,19));
        const datetimeB = new Date(b.date + 'T' + b.time.slice(11,19));
        return datetimeB - datetimeA;
    });

    const currentDate = new Date();

    const upcomingReservations = sortedUserReservations.filter(reservation => {
        const reservationDateTime = new Date(reservation.date + 'T' + reservation.time.slice(11,19));
        return reservationDateTime >= currentDate;
    });
    
    const pastReservations = sortedUserReservations.filter(reservation => {
        const reservationDateTime = new Date(reservation.date + 'T' + reservation.time.slice(11,19));
        return reservationDateTime < currentDate;
    });

    if (isLoading) {
        return <div className="loading-indicator">Loading...</div>;
    }

    return (
        <div className="index-reservations-wrapper">
            <h1 className="index-reservations-title">{currentUser.firstName} {currentUser.lastName}'s Tablr Reservations</h1>
            
            { upcomingReservations.length > 0 &&
                <div className="index-upcoming-reservations-container">
                    <h2 className="index-reservations-title">Upcoming reservations</h2>
                    {upcomingReservations.map(reservation => (
                        <ReservationIndexItem key={reservation.id} reservation={reservation} />
                    ))}
                </div>
            }
            
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