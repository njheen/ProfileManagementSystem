<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${profileName}'s Profile Card</title>
    <style>
     @import url('https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;700&display=swap');

:root {
    --bg-main: #f0f3fa;
    --card-bg: rgba(255, 255, 255, 0.85);
    --border-color: rgba(255, 255, 255, 0.6);
    --text-primary: #1e1b4b;
    --text-secondary: #4f46e5;
    --accent-primary: #ff007f;
    --accent-secondary: #7000ff;
    --accent-gradient: linear-gradient(135deg, #ff007f 0%, #7000ff 100%);
}

body {
    font-family: 'Space Grotesk', sans-serif;
    background-color: var(--bg-main);
    background-image: 
        linear-gradient(rgba(112, 0, 255, 0.04) 2px, transparent 2px),
        linear-gradient(90deg, rgba(112, 0, 255, 0.04) 2px, transparent 2px);
    background-size: 30px 30px;
    color: var(--text-primary);
    margin: 0;
    padding: 60px 20px;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    box-sizing: border-box;
}

.profile-card {
    background: var(--card-bg);
    backdrop-filter: blur(20px);
    -webkit-backdrop-filter: blur(20px);
    border: 2px solid var(--border-color);
    border-radius: 48px 16px 48px 48px;
    width: 100%;
    max-width: 580px;
    overflow: hidden;
    box-shadow: 0 30px 60px rgba(112, 0, 255, 0.12);
}

/* Bright sunrise gradient canvas band header */
.profile-banner {
    background: linear-gradient(45deg, #ff007f, #7000ff, #ff9f43);
    background-size: 200% 200%;
    animation: gradientShift 8s ease infinite;
    height: 160px;
    position: relative;
}

@keyframes gradientShift {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}

.profile-banner::after {
    content: '';
    position: absolute;
    inset: 0;
    opacity: 0.15;
    background-image: radial-gradient(#ffffff 1.5px, transparent 1.5px);
    background-size: 12px 12px;
}

.profile-avatar {
    width: 110px;
    height: 110px;
    background: #ffffff;
    border: 4px solid #ffffff;
    border-radius: 32px; 
    position: absolute;
    bottom: -50px;
    left: 40px;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 45px;
    box-shadow: 0 14px 30px rgba(255, 0, 127, 0.2);
    z-index: 2;
}

.profile-content {
    padding: 75px 40px 40px 40px;
}

.profile-header h1 {
    margin: 0;
    font-size: 34px;
    color: var(--text-primary);
    font-weight: 700;
    letter-spacing: -1px;
}

.profile-header p {
    margin: 6px 0 0 0;
    color: var(--text-secondary);
    font-size: 16px;
    font-weight: 700;
    letter-spacing: 0.5px;
}

.info-list {
    margin-top: 35px;
    border-top: 2px dashed rgba(112, 0, 255, 0.08);
    padding-top: 25px;
}

/* Bright informational data blocks */
.info-row {
    display: flex;
    align-items: center;
    margin-bottom: 16px;
    background-color: #ffffff;
    padding: 16px 20px;
    border-radius: 18px;
    border: 2px solid #edf2f7;
    transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
}

.info-row:hover {
    background-color: #ffffff;
    border-color: var(--accent-primary);
    transform: translateX(4px) scale(1.01);
    box-shadow: 0 8px 20px rgba(255, 0, 127, 0.06);
}

.info-row .row-icon {
    font-size: 20px;
    margin-right: 18px;
    width: 40px;
    height: 40px;
    background: rgba(112, 0, 255, 0.06);
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.info-details {
    flex: 1;
}

.info-label {
    font-size: 11px;
    color: #718096;
    text-transform: uppercase;
    letter-spacing: 1px;
    margin: 0;
    font-weight: 700;
}

.info-value {
    font-size: 16px;
    color: var(--text-primary);
    margin: 4px 0 0 0;
    font-weight: 600;
    line-height: 1.4;
}

.bio-section {
    margin-top: 35px;
    border-top: 2px dashed rgba(112, 0, 255, 0.08);
    padding-top: 25px;
}

.bio-section h3 {
    margin: 0 0 12px 0;
    font-size: 11px;
    color: #718096;
    text-transform: uppercase;
    letter-spacing: 1px;
    font-weight: 700;
}

/* Callout container box style rule override */
.bio-section p {
    margin: 0;
    font-size: 15px;
    line-height: 1.7;
    color: #2d3748;
    background: #ffffff;
    padding: 22px;
    border-radius: 20px;
    border: 2px solid #edf2f7;
    border-left: 5px solid var(--accent-primary);
    font-style: normal;
    font-weight: 500;
}

.btn-back {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    margin-top: 35px;
    color: var(--text-secondary);
    text-decoration: none;
    font-size: 15px;
    font-weight: 700;
    transition: all 0.2s ease;
    letter-spacing: 0.5px;
}

.btn-back:hover {
    color: var(--accent-primary);
    transform: translateX(-4px);
}
    </style>
</head>
<body>

<div class="profile-card">
    <div class="profile-banner">
        <div class="profile-avatar">✦</div>
    </div>

    <div class="profile-content">
        <div class="profile-header">
            <h1>${profileName}</h1>
            <p>${profileProgram}</p>
        </div>

        <div class="info-list">
            <div class="info-row">
                <div class="row-icon">🆔</div>
                <div class="info-details">
                    <p class="info-label">Student Matric No.</p>
                    <p class="info-value">${profileId}</p>
                </div>
            </div>

            <div class="info-row">
                <div class="row-icon">✉️</div>
                <div class="info-details">
                    <p class="info-label">Campus Email Address</p>
                    <p class="info-value">${profileEmail}</p>
                </div>
            </div>
            
            <div class="info-row">
                <div class="row-icon">🎨</div>
                <div class="info-details">
                    <p class="info-label">Hobbies & Interests</p>
                    <p class="info-value">${profileHobbies}</p>
                </div>
            </div>
        </div>

        <div class="bio-section">
            <h3>Personal Background</h3>
            <p>${profileBio}</p>
        </div>

        <a href="index.html" class="btn-back">← Register Another Profile</a>
    </div>
</div>

</body>
</html>