import './Reservations.css';

function ReservationIndexItem({ reservation }) {
    return (
        <div className="index-item-reservations-container">
            Restaurant Name: {reservation.restaurant.name}
        </div>
    )

};

export default ReservationIndexItem;