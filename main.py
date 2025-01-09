from flask import Flask, render_template, request, redirect, url_for, flash, session, jsonify
from extensions import db
import pdfkit
from models import User, Patient, Doctor, Room, Medicine, Transaction, MedicalRecord
import os
from flask_migrate import Migrate

# Load environment variables from .env file load_dotenv()
app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = os.getenv('DATABASE_URI')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SECRET_KEY'] = os.getenv('SECRET_KEY')

db.init_app(app)
migrate = Migrate(app, db)

# Definisikan filter format_rupiah
def format_rupiah(amount):
    return f"Rp {amount:,.0f}".replace(',', '.')

# Daftarkan filter ke Jinja2
app.jinja_env.filters['format_rupiah'] = format_rupiah

# Route untuk Landing Page
@app.route('/')
def landing():
    return render_template('landing.html')

# Route untuk Login
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        user = User.query.filter_by(username=username).first()

        if user and user.password == password:  # Cek password
            session['user_id'] = user.id
            session['role'] = user.role
            flash('Login berhasil!', 'success')
            return redirect(url_for('index'))  # Ganti dengan halaman yang sesuai
        else:
            flash('Username atau password salah', 'error')

    return render_template('login.html')

# Route untuk Logout
@app.route('/logout')
def logout():
    session.pop('user_id', None)
    session.pop('role', None)
    flash('Anda telah logout', 'success')
    return redirect(url_for('login'))

# Route untuk Menambahkan Pengguna
@app.route('/add_user', methods=['GET', 'POST'])
def add_user():
    if request.method == 'POST':
        try:
            username = request.form['username']
            email = request.form['email']  # Ambil email dari form
            password = request.form['password']
            
            # Membuat instance baru dari User
            new_user = User(username=username, email=email, password=password)
            
            # Menambahkan user ke database
            db.session.add(new_user)
            db.session.commit()
            
            flash('User  berhasil ditambahkan!', 'success')
            return redirect(url_for('add_user'))
        except Exception as e:
            db.session.rollback()
            flash(f'Error: {str(e)}', 'error')
            return redirect(url_for('add_user'))
    
    return render_template('add_user.html')  # Pastikan Anda memiliki template add_user.html

# Route untuk Halaman Utama setelah Login
@app.route('/index')
def index():
    if 'user_id' not in session:
        flash('Anda harus login terlebih dahulu', 'error')
        return redirect(url_for('login'))
    return render_template('index.html')

# Route untuk Pasien
@app.route('/patients', methods=['GET', 'POST'])
def patients():
    if request.method == 'POST':
        try:
            name = request.form['name']
            gender = request.form['gender']
            birth_date = request.form['birth_date']
            address = request.form['address']
            phone = request.form['phone']
            
            # Membuat instance baru dari Patient
            new_patient = Patient(
                name=name,
                gender=gender,
                birth_date=birth_date,
                address=address,
                phone=phone
            )
            
            # Menambahkan pasien ke database
            db.session.add(new_patient)
            db.session.commit()
            
            flash('Pasien berhasil ditambahkan!', 'success')
            return redirect(url_for('patients'))
        except Exception as e:
            db.session.rollback()
            flash(f'Error: {str(e)}', 'error')
            return redirect(url_for('patients'))
    
    # Mengambil semua pasien dari database
    patients = Patient.query.all()
    return render_template('patients.html', patients=patients)

# Route untuk Dokter
@app.route('/doctors', methods=['GET', 'POST'])
def doctors():
    if request.method == 'POST':
        try:
            # Mengambil data dari form
            name = request.form['name']
            gender = request.form['gender']
            phone = request.form['phone']
            specialty = request.form['specialty']
            address = request.form['address']
            
            # Membuat instance baru dari Doctor
            new_doctor = Doctor(
                name=name,
                gender=gender,
                phone=phone,
                specialty=specialty,
                address=address
            )
            
            # Menambahkan dokter ke database
            db.session.add(new_doctor)
            db.session.commit()
            
            flash('Dokter berhasil ditambahkan!', 'success')
            return redirect(url_for('doctors'))
        except Exception as e:
            db.session.rollback()  # Rollback jika terjadi kesalahan
            flash(f'Error: {str(e)}', 'error')
            return redirect(url_for('doctors'))
    
    # Mengambil semua dokter dari database
    doctors = Doctor.query.all()
    return render_template('doctors.html', doctors=doctors)

# Route untuk Ruangan
@app.route('/rooms', methods=['GET', 'POST'])
def rooms():
    from models import Room
    if request.method == 'POST':
        try:
            room_number = request.form['room_number']
            room_type = request.form['room_type']
            
            new_room = Room(
                room_number=room_number,  # Menyertakan room_number
                room_type=room_type
            )
            
            db.session.add(new_room)
            db.session.commit()
            
            flash('Ruangan berhasil ditambahkan', 'success')
            return redirect(url_for('rooms'))
        except Exception as e:
            db.session.rollback()
            flash(f'Error: {str(e)}', 'error')
            return redirect(url_for('rooms'))
            
    rooms = Room.query.all()
    return render_template('rooms.html', rooms=rooms)

# Route untuk Obat
@app.route('/medicines', methods=['GET', 'POST'])
def medicines():
    if request.method == 'POST':
        try:
            name = request.form['name']
            dosage = request.form['dosage']
            expiration_date = request.form['expiration_date']
            
            # Membuat instance baru dari Medicine
            new_medicine = Medicine(
                name=name,
                dosage=dosage,
                expiration_date=expiration_date
            )
            
            # Menambahkan obat ke database
            db.session.add(new_medicine)
            db.session.commit()
            
            flash('Obat berhasil ditambahkan!', 'success')
            return redirect(url_for('medicines'))
        except Exception as e:
            db.session.rollback()
            flash(f'Error: {str(e)}', 'error')
            return redirect(url_for('medicines'))
    
    # Mengambil semua obat dari database
    medicines = Medicine.query.all()
    return render_template('medicines.html', medicines=medicines)

# Route untuk Melihat Database
@app.route('/database')
def view_database():
    from models import Patient, Doctor, Room, Medicine, Transaction, MedicalRecord
    patients = Patient.query.all()
    doctors = Doctor.query.all()
    rooms = Room.query.all()
    medicines = Medicine.query.all()
    transactions = Transaction.query.all()
    medical_records = MedicalRecord.query.all()
    
    return render_template('database.html', 
                           patients=patients, 
                           doctors=doctors, 
                           rooms=rooms, 
                           medicines=medicines, 
                           transactions=transactions, 
                           medical_records=medical_records)

@app.route('/api/medical_record/<int:medical_record_id>', methods=['GET'])
def get_medical_record(medical_record_id):
    medical_record = MedicalRecord.query.get(medical_record_id)
    if medical_record:
        patient = Patient.query.get(medical_record.patient_id)
        doctor = Doctor.query.get(medical_record.doctor_id)
        return jsonify({
            'patient': {
                'name': patient.name,
                'address': patient.address,
                'phone': patient.phone,
                'birth_date': patient.birth_date.strftime('%d/%m/%Y'),
                'gender': patient.gender
            },
            'doctor': {
                'name': doctor.name,
                'phone': doctor.phone,
                'specialty': doctor.specialty
            }
        })
    return jsonify({'error': 'Medical Record tidak ditemukan!'}), 404

@app.route('/transactions', methods=['GET', 'POST'])
def transactions():
    if request.method == 'POST':
        try:
            transaction_date = request.form['transaction_date']
            amount = request.form['amount'].replace('.', '').replace(',', '')  # Remove currency formatting
            payment_method = request.form['payment_method'].strip()
            status = request.form['status'].strip()
            medical_record_id = request.form['medical_record_id'].strip()

            # Validate medical_record_id
            if not medical_record_id:
                flash('Medical Record ID harus diisi!', 'error')
                return redirect(url_for('transactions'))

            # Fetch medical record
            medical_record = MedicalRecord.query.get(medical_record_id)
            if not medical_record:
                flash('Medical Record tidak ditemukan!', 'error')
                return redirect(url_for('transactions'))

            # Fetch patient and doctor
            patient = Patient.query.get(medical_record.patient_id)
            doctor = Doctor.query.get(medical_record.doctor_id)

            # Prepare to create a new transaction
            new_transaction = Transaction(
                transaction_date=transaction_date,
                amount=float(amount),
                payment_method=payment_method,
                status=status,
                patient_id=patient.id,
                medical_record_id=medical_record.id
            )

            # Handle optional medicines
            medicine_ids = request.form.getlist('medicine_id')
            medicine_quantities = request.form.getlist('medicine_quantity')

            if medicine_ids and medicine_quantities:
                for medicine_id, quantity in zip(medicine_ids, medicine_quantities):
                    if medicine_id and quantity:
                        new_transaction.medicine_id = int(medicine_id)
                        new_transaction.medicine_quantity = int(quantity)

            # Add transaction to the database
            db.session.add(new_transaction)
            db.session.commit()

            flash('Transaksi berhasil ditambahkan!', 'success')
            return redirect(url_for('transactions'))
        except Exception as e:
            db.session.rollback()
            flash(f'Error: {str(e)}', 'error')
            return redirect(url_for('transactions'))

    # Fetch all transactions
    transactions = Transaction.query.all()
    formatted_transactions = [(t, format_rupiah(t.amount)) for t in transactions]
    return render_template('transactions.html', transactions=formatted_transactions)

# Pastikan folder receipts ada
RECEIPT_FOLDER = 'receipts'
if not os.path.exists(RECEIPT_FOLDER):
    os.makedirs(RECEIPT_FOLDER)

# Route print pdf
@app.route('/print_receipt_pdf/<int:transaction_id>')
def print_receipt_pdf(transaction_id):
    transaction = Transaction.query.get(transaction_id)
    if transaction is None:
        flash('Transaksi tidak ditemukan!', 'error')
        return redirect(url_for('transactions'))

    # Fetch the associated patient and doctor
    patient = Patient.query.get(transaction.patient_id)
    medical_record = MedicalRecord.query.get(transaction.medical_record_id)
    doctor = Doctor.query.get(medical_record.doctor_id) if medical_record else None

    # Render HTML for the receipt
    html_content = render_template('receipt.html', transaction=transaction, patient=patient, doctor=doctor)

    # Define path to save the PDF in the receipts folder
    pdf_path = os.path.join(RECEIPT_FOLDER, f"receipt_{transaction_id}.pdf")

    # Convert HTML to PDF
    if convert_html_to_pdf(html_content, pdf_path):
        flash(f"Struk berhasil dibuat dan disimpan di {pdf_path}", 'success')
        return redirect(url_for('transactions'))
    else:
        flash("Gagal membuat struk PDF", 'error')
        return redirect(url_for('transactions'))

def convert_html_to_pdf(html_string, pdf_path):
    # Create a PDF file from the HTML string using WeasyPrint
    HTML(string=html_string).write_pdf(pdf_path)
    return True

# Route untuk Rekam Medis
@app.route('/medical_records', methods=['GET', 'POST'])
def medical_records():
    from models import MedicalRecord
    if request.method == 'POST':
        try:
            patient_id = request.form['patient_id']
            doctor_id = request.form['doctor_id']
            disease = request.form['disease']
            service_type = request.form['service_type']
            
            new_record = MedicalRecord(
                patient_id=patient_id,
                doctor_id=doctor_id,
                disease=disease,
                service_type=service_type
            )
            
            db.session.add(new_record)
            db.session.commit()
            
            flash('Rekam medis berhasil ditambahkan!', 'success')
            return redirect(url_for('medical_records'))
        except Exception as e:
            db.session.rollback()
            flash(f'Error: {str(e)}', 'error')
            return redirect(url_for('medical_records'))
    
    records = MedicalRecord.query.all()
    return render_template('medical_records.html', records=records)

if __name__ == '__main__':
    app.run()
