import './App.scss';
import Authentication from './components/Authentication';
import Home from './components/SideBar/Home/Home'
import { BrowserRouter, Routes, Route, Outlet } from "react-router-dom";
import { Link } from "react-router-dom";

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/Authentication" element={<Authentication />} />
      </Routes>
    </BrowserRouter>
  );
}
export default App;

