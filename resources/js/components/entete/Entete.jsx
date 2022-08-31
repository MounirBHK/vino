import React, { useContext } from "react";
import { Link } from "react-router-dom";
import CelliersContext from "../../context/celliersContext";
import "./Entete.scss";

function Entete() {
    return (
        <div className="App-header">
            <h1>Hello World</h1>
            <Link to="/">Mes celliers</Link>
        </div>
    );
}

export default Entete;
