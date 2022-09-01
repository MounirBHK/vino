import React from "react";
import "./HomepageActions.scss";
import Fab from "@mui/material/Fab";
import { Link } from "react-router-dom";

function HomepageActions() {
    return (
        <React.Fragment>
            <Fab variant="extended">
                {" "}
                <Link to="/login">Connexion</Link>
            </Fab>
            <Fab variant="extended">
                {" "}
                <Link to="/signup">Souscription</Link>
            </Fab>
        </React.Fragment>
    );
}

export default HomepageActions;
