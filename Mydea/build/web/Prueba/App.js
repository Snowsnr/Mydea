const imagePreview = document.getElementById('img-preview');
const imageUploader = document.getElementById('img-uploader');
const imageUploadbar = document.getElementById('img-upload-bar');

const CLOUDINARY_URL = `https://api.cloudinary.com/v1_1/digt8oaow/image/upload`;
const CLOUDINARY_UPLOAD_PRESET = 'oxfoqolm';

imageUploader.addEventListener('change', async (e) => {
    // console.log(e);
    const file = e.target.files[0];
    const formData = new FormData();
    formData.append('file', file);
    formData.append('upload_preset', CLOUDINARY_UPLOAD_PRESET);

    // Send to cloudianry
    const res = await axios.post(
        CLOUDINARY_URL,
        formData,
        {
            headers: {
                'Content-Type': 'multipart/form-data'
            },
            onUploadProgress (e) {
                let progress = Math.round((e.loaded * 100.0) / e.total);
                console.log(progress);
                imageUploadbar.setAttribute('value', progress);
            }
        }
    );
    console.log("holaaa"+res.data.secure_url);
    imagePreview.src = res.data.secure_url;
    
});