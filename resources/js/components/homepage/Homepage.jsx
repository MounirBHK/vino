import React from "react";
import "./Homepage.scss";
import logoJaune from "../../../images/logoJaune.png";
import HomepageActions from "./HomepageActions";
import Signup from "./Signup";
import Login from "./Login";
import { Route, Routes } from "react-router-dom";

function Homepage() {
    return (
        <div className="Homepage">
            <img className="homepage-logo" src={logoJaune} alt="logo" />
            <Routes>
                <Route path="/login" element={<Login />}></Route>
                <Route path="/signup" element={<Signup />}></Route>
                <Route path="/" element={<HomepageActions />}></Route>
            </Routes>
        </div>
    );
}

export default Homepage;
