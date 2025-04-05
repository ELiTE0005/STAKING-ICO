import React, { useEffect, useState } from "react";
import { ConnectButton } from "@rainbow-me/rainbowkit";
import { useAccount } from "wagmi";

//INTERNAL IMPORT
import { MdGeneratingTokens } from "../Components/ReactICON/index";

const Header = ({ page }) => {
  const [tokenBalComp, setTokenBalComp] = useState();

  const navigation = [
    {
      name: "Home",
      link: "#home",
    },
    {
      name: "Staking",
      link: "#staking",
    },
    {
      name: "Crypto",
      link: "#crypto",
    },
    {
      name: "Partners",
      link: "#partners",
    },
  ];

  return (
    <header className="header">
      <div className="container">
        <div className="row">
          <div className="col-12">
          <div className="header__content" style={{ display: "flex", alignItems: "center", gap: "30px" }}>
  <button
    className="header_btn"
    type="button"
    aria-label="header_nav"
  >
    <span />
    <span />
    <span />
  </button>

  <a href="/" className="header_logo">
    <img src="img/logo.svg" alt="" />
  </a>

  <span className="header__taglike" style={{ color: "white" }}>Stake-X</span>

  <ul className="header__nav" id="header__nav" style={{ display: "flex", gap: "30px", alignItems: "center" }}>
    {navigation.map((item, index) => (
      <li key={index}>
        <a 
          href={
            page === "activity"
              ? "/"
              : page === "admin"
                ? "/"
                : `${item.link}`
          }
        >
          {item.name}
        </a>
      </li>
    ))}
  </ul>

  <ConnectButton />

  <a 
    style={{ marginLeft: "10px" }}
    data-bs-target="#modal-deposit1"
    type="button"
    data-bs-toggle="modal"
    className="header__profile"
  >
    <i className="ti ti-user-circle">
      <MdGeneratingTokens />
    </i>
    <span> TOKEN ICO</span>
  </a>
</div>

          </div>
        </div>
      </div>
    </header>
  );
};

export default Header;