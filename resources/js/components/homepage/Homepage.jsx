import React from "react";
import "./Homepage.scss";
import logoJaune from "../../../images/logoJaune.png";
import HomepageActions from "./HomepageActions";
import Signup from "./Signup";
import Login from "./Login";
import { Navigate, Route, Routes } from "react-router-dom";

function Homepage() {
    return (
        <div className="Homepage">
            <div className="logo">
                <img className="homepage-logo" src={logoJaune} alt="logo" />
                <h1>vino.</h1>
            </div>
            <Routes>
                <Route path="/login" element={<Login />}></Route>
                <Route path="/signup" element={<Signup />}></Route>
                <Route path="/" element={<HomepageActions />}></Route>
                <Route
                    path="*"
                    element={<Navigate to="/login" replace />}
                ></Route>
            </Routes>
        </div>
    );
}

export default Homepage;
