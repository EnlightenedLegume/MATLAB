function scaled = featScale(data)

scaled = (data - min(data))/(max(data) - min(data));