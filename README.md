# n8n + FFmpeg on Railway

Complete n8n automation platform with video processing capabilities, deployed on Railway.

## 🚀 Features

- ✅ **n8n Workflow Automation** - Complete automation platform
- ✅ **FFmpeg Video Processing** - Merge, edit, and process videos
- ✅ **ImageMagick Support** - Image manipulation capabilities  
- ✅ **PostgreSQL Database** - Persistent workflow and execution storage
- ✅ **Railway Optimized** - Configured for Railway's infrastructure

## 🏗️ Architecture

```
Railway Project:
├── n8n Application (this container)
├── PostgreSQL Database (Railway service)
└── Shared $5/month credit
```

## 🔧 Environment Variables

The following environment variables are configured automatically by Railway:

- `N8N_HOST` - Your Railway public domain
- `N8N_PORT` - Port 5678 (default)
- `N8N_PROTOCOL` - https (Railway provides SSL)
- `DB_TYPE` - postgresdb
- `DB_POSTGRESDB_HOST` - Railway PostgreSQL host
- `DB_POSTGRESDB_PORT` - Railway PostgreSQL port
- `DB_POSTGRESDB_DATABASE` - Database name
- `DB_POSTGRESDB_USER` - Database user
- `DB_POSTGRESDB_PASSWORD` - Database password

## 🎬 Video Processing Capabilities

With FFmpeg installed, you can use the Execute Command node for:

- **Video Merging**: Combine multiple video files
- **Format Conversion**: Convert between video formats
- **Compression**: Reduce video file sizes
- **Audio Processing**: Extract or modify audio tracks
- **Thumbnail Generation**: Create video previews

## 🚀 Quick Deploy

1. Fork this repository
2. Connect to Railway
3. Add PostgreSQL database
4. Configure environment variables
5. Deploy!

## 📝 Usage Examples

### Video Merging Command:
```bash
ffmpeg -i video1.mp4 -i video2.mp4 -filter_complex '[0:v][0:a][1:v][1:a]concat=n=2:v=1:a=1[v][a]' -map '[v]' -map '[a]' output.mp4
```

### Image Processing:
```bash
convert input.jpg -resize 800x600 output.jpg
```

## 🔗 Links

- [n8n Documentation](https://docs.n8n.io/)
- [FFmpeg Documentation](https://ffmpeg.org/documentation.html)
- [Railway Documentation](https://docs.railway.app/)
