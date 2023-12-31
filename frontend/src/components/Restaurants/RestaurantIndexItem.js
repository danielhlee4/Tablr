import React, { useState, useEffect } from 'react';
import { useSelector } from 'react-redux';
import { getReviewsByRestaurantId } from '../../store/reviews';
import { Link, useHistory } from 'react-router-dom';
// import badroman from '../../assets/badroman.webp'
import { convertTo12HourFormat } from '../../util/timeUtils';
import StarAverage from '../Reviews/StarAverage';

function RestaurantIndexItem({ restaurant }) {
    const [isRaised, setIsRaised] = useState(false);
    const [isClicked, setIsClicked] = useState(false);
    const [nextThreeTimes, setNextThreeTimes] = useState([]);
    const reviews = useSelector(state => getReviewsByRestaurantId(state, restaurant.id));
    const history = useHistory();

    const calculateRoundedUpTime = () => {
        const now = new Date();
        let hours = now.getHours();
        let minutes = now.getMinutes();

        // Start with 11 AM the next day
        if (hours >= 22) {
            now.setDate(now.getDate() + 1);
            return "11:00";
        }
        
        // If it's before 11 AM, start with 11 AM on the same day
        if (hours < 11) {
            return "11:00";
        }

        if (minutes < 30) {
            minutes = 30;
        } else {
            minutes = 0;
            hours += 1;
        }

        const hoursString = hours.toString().padStart(2, '0');
        const minutesString = minutes.toString().padStart(2, '0');
        
        return `${hoursString}:${minutesString}`;
    };

    function isValidTime(selectedTime) {
        const closingTime = 22; // 10 PM
        const openingTime = 11; // 11 AM
      
        // Convert selected time to a 24-hour format number.
        const timeParts = selectedTime.split(':');
        const hour = parseInt(timeParts[0], 10);
      
        return hour >= openingTime && hour < closingTime;
    }

    function generateSurroundingTimes(selectedTime) {
        const interval = 30;
        let times = [];
      
        // Convert selected time to minutes.
        let [hours, minutes] = selectedTime.split(':').map(num => parseInt(num, 10));
        let selectedTimeInMinutes = hours * 60 + minutes;
      
        // Generate times
        for (let i = 0; i < 3; i++) {
          let currentTimeInMinutes = selectedTimeInMinutes + i * interval;
          let currentHours = Math.floor(currentTimeInMinutes / 60);
          let currentMinutes = currentTimeInMinutes % 60;
      
          // Convert back to a time format
          let timeString = 
            currentHours.toString().padStart(2, '0') + ':' + 
            currentMinutes.toString().padStart(2, '0');
      
          // Validate and add to array
          if (isValidTime(timeString)) {
            times.push(timeString);
          }
        }
      
        return times;
    }

    useEffect(() => {
        const nextTime = calculateRoundedUpTime();
        const threeTimes = generateSurroundingTimes(nextTime);
        setNextThreeTimes(threeTimes);
    }, []);

    const handleMouseEnter = () => {
        setIsRaised(true);
    };
    
    const handleMouseLeave = () => {
        setIsRaised(false);
    };
    
    const handleClick = () => {
        setIsClicked(!isClicked);
    };

    const handleTimeClick = (event, time) => {
        event.preventDefault();
        event.stopPropagation();
        history.push(`/restaurants/${restaurant.id}`, { selectedTime: time });
    };

    const containerClasses = `restaurant-container ${isRaised ? 'raised' : ''} ${isClicked ? 'clicked' : ''}`;

    return (
        <Link 
            to={`/restaurants/${restaurant.id}`}
            className={containerClasses}
            onMouseEnter={handleMouseEnter}
            onMouseLeave={handleMouseLeave}
            onClick={handleClick}
        >
            <div className="image-container">
                <img 
                    src={restaurant.photoUrl}
                    // src={badroman}
                    alt={`image of ${restaurant.name}`} 
                />
            </div>
            <div className="text-container">
                <h2 id="restaurant-name">{restaurant.name}</h2>
                <div className="inline-ratings-reviews">
                    <StarAverage reviews={reviews} />
                    <span className="inline-ratings-reviews-text">{reviews.length} reviews</span>
                </div>
                <div className="inline-description">
                    <span>{restaurant.cuisine}</span>
                    <span className="expense-container">
                        <span className={restaurant.expense.length >= 1 ? "active" : "inactive"}>$</span>
                        <span className={restaurant.expense.length >= 2 ? "active" : "inactive"}>$</span>
                        <span className={restaurant.expense.length >= 3 ? "active" : "inactive"}>$</span>
                        <span className={restaurant.expense.length >= 4 ? "active" : "inactive"}>$</span>
                    </span>
                    <span>{restaurant.neighborhood}</span>
                </div>
                <div className="restaurant-index-reservation-times">
                    {nextThreeTimes.map(time => (
                        <button key={time} className="restaurant-index-reservation-time" onClick={(e) => handleTimeClick(e, time)}>
                            {convertTo12HourFormat(time)}
                        </button>
                    ))}
                </div>
            </div>
        </Link>
    )
}

export default RestaurantIndexItem;