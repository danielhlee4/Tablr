// Action constants and their corresponding actions
export const RECEIVE_RESERVATIONS = 'reservations/RECEIVE_RESERVATIONS';
export const RECEIVE_RESERVATION = 'reservations/RECEIVE_RESERVATION';
export const REMOVE_RESERVATION = 'reservations/REMOVE_RESERVATION';

export const receiveReservations = reservations => ({
    type: RECEIVE_RESERVATIONS,
    reservations
});

export const receiveReservation = reservation => ({
    type: RECEIVE_RESERVATION,
    reservation
});

export const removeReservation = reservationId => ({
    type: REMOVE_RESERVATION,
    reservationId
});

// Selectors
export const getReservation = reservationId => state => {
    return state.reservations[reservationId] || null;
}

export const getReservations = state => {
    return Object.values(state.reservations || {});
}

// Thunk action creators
export const fetchReservations = () => async dispatch => {
    const res = await fetch('/api/reservations');

    if (res.ok) {
        const reservations = await res.json();
        dispatch(receiveReservations(reservations));
    }
}

export const fetchReservation = reservationId => async dispatch => {
    const res = await fetch(`/api/reservations/${reservationId}`);

    if (res.ok) {
        const reservation = await res.json();
        dispatch(receiveReservation(reservation));
    }
}

export const createReservation = reservation => async dispatch => {
    const res = await fetch(`/api/reservations`, {
        method: 'POST',
        body: JSON.stringify(reservation),
        headers: { 'Content-Type': 'application/json' }
    });

    if (res.ok) {
        const newReservation = await res.json();
        dispatch(receiveReservation(newReservation));
    }
}

export const updateReservation = reservation => async dispatch => {
    const res = await fetch(`/api/reservations/${reservation.id}`, {
        method: 'PATCH',
        body: JSON.stringify(reservation),
        headers: { 'Content-Type': 'application/json' }
    });

    if (res.ok) {
        const updatedReservation = await res.json();
        dispatch(receiveReservation(updatedReservation));
    }
}

export const deleteReservation = reservationId => async dispatch => {
    const res = await fetch(`/api/reservations/${reservationId}`, {
        method: 'DELETE'
    });

    if (res.ok) {
        dispatch(removeReservation(reservationId));
    }
}

// Reducer
const reservationsReducer = (state = {}, action) => {
    const nextState = { ...state };

    switch (action.type) {
        case RECEIVE_RESERVATIONS:
            return { ...action.reservations };
        case RECEIVE_RESERVATION:
            nextState[action.reservation.id] = action.reservation;
            return nextState;
        case REMOVE_RESERVATION:
            delete nextState[action.reservationId];
            return nextState;
        default:
            return state;
    }
}

export default reservationsReducer;