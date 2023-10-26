export const convertTo12HourFormat = (time24) => {
    let [hour, minute] = time24.split(':');
    hour = parseInt(hour);
    const period = hour >= 12 ? 'PM' : 'AM';

    if(hour > 12) {
        hour -= 12;
    } else if(hour === 0) {
        hour = 12;
    }
    
    return `${hour}:${minute} ${period}`;
};