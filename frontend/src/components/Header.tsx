import { Link } from "react-router-dom";

const Header = () => {
  const handleLogout = () => {
    localStorage.removeItem("token");
    window.location.href = "/login";
  };

  return (
    <header style={{ backgroundColor: "#333", padding: "10px", color: "#fff" }}>
      <h1>Motel Booking</h1>
      <nav>
        <Link to="/dashboard" style={{ marginRight: "10px", color: "#fff" }}>Dashboard</Link>
        <button onClick={handleLogout} style={{ backgroundColor: "red", color: "white" }}>Sair</button>
      </nav>
    </header>
  );
};

export default Header;
