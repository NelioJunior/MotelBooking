import { Link } from "react-router-dom";

const Sidebar = () => {
  return (
    <aside style={{ width: "250px", backgroundColor: "#222", color: "#fff", height: "100vh", padding: "20px" }}>
      <nav>
        <ul style={{ listStyle: "none", padding: "0" }}>
          <li><Link to="/dashboard" style={{ color: "#fff" }}>� Dashboard</Link></li>
          <li><Link to="/reservas" style={{ color: "#fff" }}>� Reservas</Link></li>
          <li><Link to="/faturamento" style={{ color: "#fff" }}>� Faturamento</Link></li>
        </ul>
      </nav>
    </aside>
  );
};

export default Sidebar;
