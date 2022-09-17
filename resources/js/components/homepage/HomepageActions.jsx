import React from "react";
import "./HomepageActions.scss";
import Fab from "@mui/material/Fab";
import { Link } from "react-router-dom";

function HomepageActions() {
    return (
        <div className="accueil">
            <Fab variant="extended" className="login">
                {" "}
                <Link to="/login">Connexion</Link>
            </Fab>
            <Fab variant="extended" className="signup">
                {" "}
                <Link to="/signup">Souscription</Link>
            </Fab>
        </div>
    );
}

export default HomepageActions;
