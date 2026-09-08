const express = require('express');
const nodemailer = require('nodemailer');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Gmail SMTP Transporter Configuration
// Replace YOUR_GMAIL_APP_PASSWORD with your 16-character App Password generated from Google Account Security
const GMAIL_USER = process.env.GMAIL_USER || 'devilsun807@gmail.com';
const GMAIL_APP_PASS = process.env.GMAIL_APP_PASS || 'YOUR_GMAIL_APP_PASSWORD';

const transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: GMAIL_USER,
    pass: GMAIL_APP_PASS
  }
});

app.post('/api/contact', async (req, res) => {
  const name = req.body['Full Name'] || req.body.name || '';
  const email = req.body['Email Address'] || req.body.email || '';
  const phone = req.body['Phone Number'] || req.body.phone || '';
  const subject = req.body['Subject'] || req.body.subject || 'Website Inquiry';
  const message = req.body['Message Description'] || req.body.message || '';

  if (!name || !email || !message) {
    return res.status(400).json({ success: false, message: 'Required fields missing.' });
  }

  const mailOptions = {
    from: `"Shree Vasuki Charitable Trust" <${GMAIL_USER}>`,
    replyTo: `${name} <${email}>`,
    to: 'devilsun807@gmail.com',
    subject: `Contact Form: ${subject}`,
    text: `
==========================================
 NEW CONTACT FORM SUBMISSION
==========================================

Full Name:            ${name}
Email Address:        ${email}
Phone Number:         ${phone || 'N/A'}
Subject:              ${subject}

Message / Description:
${message}

==========================================
`,
    html: `
    <div style="font-family: Arial, sans-serif; max-width: 600px; padding: 20px; border: 1px solid #e5e7eb; border-radius: 8px;">
      <h2 style="color: #1c2057; border-bottom: 2px solid #4f46e5; padding-bottom: 8px; margin-top: 0;">New Contact Form Message</h2>
      <table style="width: 100%; border-collapse: collapse; margin-top: 15px;">
        <tr style="border-bottom: 1px solid #f3f4f6;"><td style="padding: 10px 0; font-weight: bold; width: 150px; color: #4b5563;">Full Name:</td><td style="color: #111827;">${name}</td></tr>
        <tr style="border-bottom: 1px solid #f3f4f6;"><td style="padding: 10px 0; font-weight: bold; color: #4b5563;">Email Address:</td><td style="color: #111827;"><a href="mailto:${email}" style="color: #2563eb;">${email}</a></td></tr>
        <tr style="border-bottom: 1px solid #f3f4f6;"><td style="padding: 10px 0; font-weight: bold; color: #4b5563;">Phone Number:</td><td style="color: #111827;">${phone || 'N/A'}</td></tr>
        <tr style="border-bottom: 1px solid #f3f4f6;"><td style="padding: 10px 0; font-weight: bold; color: #4b5563;">Subject:</td><td style="color: #111827;">${subject}</td></tr>
      </table>
      <div style="margin-top: 20px; padding: 16px; background-color: #f9fafb; border-left: 4px solid #4f46e5; border-radius: 4px;">
        <strong style="color: #374151; display: block; margin-bottom: 6px;">Message / Description:</strong>
        <p style="margin: 0; white-space: pre-wrap; color: #1f2937; line-height: 1.6;">${message}</p>
      </div>
    </div>
    `
  };

  try {
    await transporter.sendMail(mailOptions);
    res.status(200).json({ success: true, message: 'All form details sent directly to devilsun807@gmail.com!' });
  } catch (error) {
    console.error('SMTP Error:', error);
    res.status(500).json({ success: false, message: 'SMTP error occurred.', error: error.message });
  }
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`SMTP Mail Server running on http://localhost:${PORT}`);
});
