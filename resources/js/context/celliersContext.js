import React from "react";

const CelliersContext = React.createContext();
CelliersContext.displayName = "CelliersContext";

export const CelliersProvider = CelliersContext.Provider;

export default CelliersContext;
