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

export function adjustForDST(dateStr, timeStr) {
    const combinedDate = new Date(`${dateStr}T${timeStr.split('T')[1]}`);
    
    const DST_START_2023 = new Date('2023-03-10T00:00:00');
    const DST_END_2023 = new Date('2023-11-05T00:00:00');
    
    const DST_START_2024 = new Date('2024-03-10T00:00:00');
    const DST_END_2024 = new Date('2024-11-03T00:00:00');

    if ((combinedDate >= DST_START_2023 && combinedDate < DST_END_2023) ||
        (combinedDate >= DST_START_2024 && combinedDate < DST_END_2024)) {
        // The time is during Daylight Saving Time, so adjust by -1 hour
        combinedDate.setHours(combinedDate.getHours() - 1);
    }

    return combinedDate;
}
