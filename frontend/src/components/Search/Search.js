import { useState, useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { clearSearchResults, fetchSearchResults } from "../../store/search";
import { useHistory } from "react-router-dom";

function SearchBar() {
    const [searchText, setSearchText] = useState("")
    const [showSearchResults, setShowSearchResults] = useState(false);
    const dispatch = useDispatch();
    const searchResults = useSelector(state => Object.values(state.search));
    const history = useHistory();

    const openSearchResults = () => {
        if (showSearchResults) return;
        setShowSearchResults(true);
    };

    useEffect(() => {
        if (!showSearchResults) return;
    
        const closeSearchResults = () => {
            setShowSearchResults(false);
        };
    
        document.addEventListener('click', closeSearchResults);
      
        return () => document.removeEventListener("click", closeSearchResults);
    }, [showSearchResults]);

    function handleChange(e) {
        const query = e.target.value;
        setSearchText(query);
        if (query.trim() !== "") {
            dispatch(fetchSearchResults(query))
        } else {
            dispatch(clearSearchResults())
        }
    };

    function handleClickLink(id) {
        return (e) => {
            e.preventDefault();
            history.push(`/restaurants/${id}`);
            dispatch(clearSearchResults());
            setSearchText("");
            setShowSearchResults(false);
        }
    }

    function handleSubmit(e) {
        e.preventDefault();
        if (searchText.trim() !=="") {
            setSearchText("");
            history.push(`/search?query=${searchText}`)
            // dispatch(clearSearchResults());
        }
    };

    return (
        <div className="searchbar-container">
            <input
                type="text"
                id="search-input"
                placeholder="Find your restaurant"
                value={searchText}
                onChange={(e) => { handleChange(e); openSearchResults(); }}
            ></input>

            <button onClick={handleSubmit}>Search</button>

            {showSearchResults && searchText && (
                <ul id="search-dropdown">
                    {searchResults.map(result => (
                        <li key={result.id} onClick={handleClickLink(result.id)} className="search-dropdown-item">
                            {result.name}
                        </li>
                    ))}
                </ul>
            )}
        </div>
    )
}

export default SearchBar;