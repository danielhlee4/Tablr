import csrfFetch from "./csrf";

// Action constants and their corresponding actions
export const RECEIVE_RESERVATIONS = 'reservations/RECEIVE_RESERVATIONS';
export const RECEIVE_RESERVATION = 'reservations/RECEIVE_RESERVATION';
export const REMOVE_RESERVATION = 'reservations/REMOVE_RESERVATION';
export const CREATE_RESERVATION_FAILURE = "reservations/CREATE_RESERVATION_FAILURE";

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

export const reservationCreationFailure = (error) => ({
    type: CREATE_RESERVATION_FAILURE,
    error
});

// Selectors
export const getReservation = reservationId => state => {
    return state.reservations[reservationId] || null;
}

export const getReservations = state => {
    return Object.values(state.reservations || {});
}

export const getReservationCreationError = state => {
    return state.reservations.reservationCreationError || null;
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
        return reservation;
    } else {
        throw new Error('Failed to fetch reservation');
    }
}

export const createReservation = reservation => async dispatch => {
    try {
        const res = await csrfFetch(`/api/reservations`, {
            method: 'POST',
            body: JSON.stringify(reservation),
            headers: { 'Content-Type': 'application/json' }
        });

        const data = await res.json();

        if (res.ok) {
            dispatch(receiveReservation(data));
        } else {
            dispatch(reservationCreationFailure(data.errors.join(', ')));
        }
        return res;
    } catch (error) {
        console.error("Error during reservation:", error);
        dispatch(reservationCreationFailure("An unexpected error occurred."));
        return null;
    }
};


export const updateReservation = reservation => async dispatch => {
    try {
        const res = await csrfFetch(`/api/reservations/${reservation.id}`, {
            method: 'PATCH',
            body: JSON.stringify(reservation),
            headers: { 'Content-Type': 'application/json' }
        });

        const data = await res.json();

        if (res.ok) {
            dispatch(receiveReservation(data));
        } else {
            dispatch(reservationCreationFailure(data.errors.join(', ')));
        }
        return res;
    } catch (error) {
        console.error("Error during reservation update:", error);
        dispatch(reservationCreationFailure("An unexpected error occurred."));
        return null;
    }
};


export const deleteReservation = reservationId => async dispatch => {
    const res = await csrfFetch(`/api/reservations/${reservationId}`, {
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
        case CREATE_RESERVATION_FAILURE:
            return { ...state, reservationCreationError: action.error };
        default:
            return state;
    }
}

export default reservationsReducer;