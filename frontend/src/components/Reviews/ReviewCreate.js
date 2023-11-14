import React, { useState, useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { useParams, useHistory } from 'react-router-dom';
import StarRating from './StarRating';
import { createReview, fetchReviews } from '../../store/reviews';
import { getReservation, fetchReservation } from '../../store/reservations';
import './Reviews.css';

function ReviewCreate() {
    const { reservationId } = useParams();
    const dispatch = useDispatch();
    const history = useHistory();
    const reservation = useSelector(state => getReservation(reservationId)(state));
    const [isLoading, setIsLoading] = useState(true);
    const [error, setError] = useState(null);

    useEffect(() => {
        const loadData = async () => {
            try {
                await dispatch(fetchReservation(reservationId));
                setIsLoading(false);
            } catch (e) {
                setError(e.message);
            }
        };

        loadData();
    }, [dispatch, reservationId]);

    const [reviewBody, setReviewBody] = useState('');
    const [ratings, setRatings] = useState({
        overallRating: 0,
        foodRating: 0,
        serviceRating: 0,
        ambianceRating: 0,
        valueRating: 0,
    });

    const changeRating = (category, newRating) => {
        setRatings({ ...ratings, [category]: newRating });
    };

    if (isLoading) {
        return <div>Loading...</div>;
    }

    if (error) {
        return <div>Error: {error}</div>;
    }

    if (!reservation) {
        return <div>Reservation not found.</div>;
    }

    const restaurantId = reservation.restaurant.id;

    const handleSubmit = async (e) => {
        e.preventDefault();
        
        const reviewData = {
            review: {
                ...ratings,
                body: reviewBody,
                reservationId,
                restaurantId,
            },
        };
        
        try {
            await dispatch(createReview(reviewData));
            history.push(`/restaurants/${restaurantId}`);
        } catch (errorResponse) {
            const errorData = await errorResponse.json();
            setError(errorData.errors.join(', '));
        }
    };
      
    return(
        <>
            <form onSubmit={handleSubmit}>
                <StarRating label="Overall" category="overallRating" onChangeRating={changeRating} />
                <StarRating label="Food" category="foodRating" onChangeRating={changeRating} />
                <StarRating label="Service" category="serviceRating" onChangeRating={changeRating} />
                <StarRating label="Ambiance" category="ambianceRating" onChangeRating={changeRating} />
                <StarRating label="Value" category="valueRating" onChangeRating={changeRating} />
                <textarea
                    className="review-textarea"
                    value={reviewBody}
                    onChange={(e) => setReviewBody(e.target.value)}
                    placeholder="Your review must be at least 10 characters"
                    minLength="10"
                    required
                />
                <button type="submit" className="submit-review-btn">Submit</button>
            </form>
            {error && <div className="review-error-message">{error}</div>}
        </>
    )
}

export default ReviewCreate;