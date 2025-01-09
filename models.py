from extensions import db
from datetime import date

class User(db.Model):
    __tablename__ = 'user'

    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(50), unique=True, nullable=False)
    email = db.Column(db.String(100), unique=True, nullable=False)
    password = db.Column(db.String(200), nullable=False)
    role = db.Column(db.Enum('user'), nullable=False)  # Hanya 'user' yang diizinkan

    def __init__(self, username, email, password):
        self.username = username
        self.email = email
        self.password = password
        self.role = 'user'  # Set role ke 'user' secara default

class Patient(db.Model):
    __tablename__ = 'patient'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    gender = db.Column(db.String(10), nullable=False)
    birth_date = db.Column(db.Date, nullable=False)
    address = db.Column(db.String(200), nullable=False)
    phone = db.Column(db.String(15), nullable=False)

class Doctor(db.Model):
    __tablename__ = 'doctor'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    gender = db.Column(db.String(10), nullable=False)
    phone = db.Column(db.String(15), nullable=False)
    specialty = db.Column(db.String(100), nullable=False)
    address = db.Column(db.String(200), nullable=False)

class Room(db.Model):
    __tablename__ = 'room'
    id = db.Column(db.Integer, primary_key=True)
    room_number = db.Column(db.String(50), nullable=False)  # Menambahkan kolom room_number
    room_type = db.Column(db.String(50), nullable=False)

class Medicine(db.Model):
    __tablename__ = 'medicine'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    dosage = db.Column(db.String(50), nullable=False)
    expiration_date = db.Column(db.Date, nullable=False)

class Transaction(db.Model):
    __tablename__ = 'transaction'
    id = db.Column(db.Integer, primary_key=True)
    transaction_date = db.Column(db.Date, nullable=False)
    amount = db.Column(db.Float, nullable=False)
    payment_method = db.Column(db.String(50), nullable=False)
    status = db.Column(db.String(20), nullable=False)
    patient_id = db.Column(db.Integer, db.ForeignKey('patient.id'), nullable=False)
    medical_record_id = db.Column(db.Integer, db.ForeignKey('medicalrecord.id'), nullable=False)
    medicine_id = db.Column(db.Integer, db.ForeignKey('medicine.id'), nullable=True)  # Optional
    medicine_quantity = db.Column(db.Integer, nullable=True)  # Optional

    # Relationships
    patient = db.relationship('Patient', backref=db.backref('transactions', lazy=True))
    medical_record = db.relationship('MedicalRecord', backref=db.backref('transactions', lazy=True))
    medicine = db.relationship('Medicine', backref=db.backref('transactions', lazy=True))

class MedicalRecord(db.Model):
    __tablename__ = 'medicalrecord'
    id = db.Column(db.Integer, primary_key=True)
    patient_id = db.Column(db.Integer, db.ForeignKey('patient.id'), nullable=False)
    doctor_id = db.Column(db.Integer, db.ForeignKey('doctor.id'), nullable=False)
    disease = db.Column(db.String(100), nullable=False)
    service_type = db.Column(db.String(100), nullable=False)

    # Relationships
    patient = db.relationship('Patient', backref=db.backref('medical_records', lazy=True))
    doctor = db.relationship('Doctor', backref=db.backref('medical_records', lazy=True))