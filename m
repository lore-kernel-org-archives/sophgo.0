Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7327F23BCEE
	for <sophgo@lists.linux.dev>; Fri, 12 Dec 2025 18:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765565328; cv=none; b=A77B5zIAQ1A1P0JOxYKPS/OaCdtoTW0Kgtbto4FsJWrud3IE0dTkDDPaE7/2NJkY0573GiFxMJ44i2eNi8SlhiAVdnfuv8fGa28bDF03JazxdxZrTAXTvG6DEyimIkcq9yVoxnxv384tGmDHWKZW1SmwK0e3ELV0m4twzE5asDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765565328; c=relaxed/simple;
	bh=dVjh0U3UIiGWBr09A35mSxFYskTpyF7fOa/XhBzrgyI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=tZnQQo05W33d/rsFHgiB/1xLphPpcWbfobzhxtn1B0x/Xt6x3JKG/iPPR7xPEdp3LJrE/M4rUzSyORJZ4pSN8bcdcSYA22gPbJGPUC5S639tBnpqzSlj6AuaSaeTe5k4bO7hJr8pwCL5TrerfAQ6R3etkgZeQDIiO+G5f1OfhoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ntTw301j; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ntTw301j"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477563e28a3so11830475e9.1
        for <sophgo@lists.linux.dev>; Fri, 12 Dec 2025 10:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765565325; x=1766170125; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ws8si3q8m+pORfnElCi6zW3h1zosQU2jocpsY2hNquM=;
        b=ntTw301jG7rbnqYVezxGsp+pzh1o6tQ/cdUo8Ul9YWVQ+9FiBQryzuCEIffZOR+cr3
         WUcQJtpQ5mSF1WX2QXGlpcK0mCtGy9/rquE5seGv6gYNK7ugG+rnmDkUxaGW/xYTxlY/
         W1c3FMwsgTYMTED+N1hKt2HF7LubF9le8XkxjUorldFi8OtwIr5lZhpOt46EKlKqaYx/
         99+e/VULhqFoHvShLeCzbglyEAgucPt3rpWKkOLmSM3K9+hW3jdmdqoneX2CtISAwn7o
         E4zdUF5DFRuLnJzCUEk+zq6RsAHslKtPLpe/Px4nlyRCDR2fTOpSqlvIU2O5KNEf/unO
         8tAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765565325; x=1766170125;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ws8si3q8m+pORfnElCi6zW3h1zosQU2jocpsY2hNquM=;
        b=J8KtqI8soGMXvuCc8pGIj3g8x34icLvFCdqo2suln+AJLf1qS1CLjGjq21E8HG/4pe
         5du81+CL5CuAu9LafPVdm7mKXPCxYFZY7Xbhy9XF/G1TSiwTUBmP+PN/KmNlNN5RlrOw
         gBx/3tu2PH5wHVGs4HXHSe/XnkF14/Eb+2RF7nwMXjdTQ0jifitioC372RnYpXHBgXEA
         zzwc2IFZfwenmqBJ5FtpvOGGsCwjYKvsadxByGXmo9aRKHVTQl+7/qujtR9mYu5ZOJ6g
         1kr5/14pf/tnC2+yeMC5Jh7RRaAoPuqzV6bCwjX5kqz6rbWGjcXG5EownS5UFXXKgfDR
         wSxg==
X-Forwarded-Encrypted: i=1; AJvYcCW8C7IwzuVV/VDZfYEXsotojMWQD9Xa1hiTk3L0MTFF/W/7eR2lKyB248kLGZGEhsqxfi8q/oA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyfeXuosN1kIoE5o9Qy5KPCIHXcXo2dF9CdvabIxsvrM+V/IQE5
	Ycq8nXvzu31HyalP+sUg12N1QAw5qlHh+Hk01x5mAC6eYBllY8Zx4wBG
X-Gm-Gg: AY/fxX7AfYDJMqhrUrhnrlakk8NxFCXpXZTqO3BLgkDI4+tC6nOtBwyKUDMqAp487SW
	QMhn5/OI58b8pwfm3VBEj3JQqqM32th9YZH6bZhQUg52ZuffJqTUqF6JF1Wo8qproHPmlRuRv95
	vvjJRQt2+zbf6MN0qv6HO7lhDPt4I2ZjUD6P9zgeZ5+Q3Gd8Gd0eApX3Y+GlGbl0qQApOa5P8fd
	8omG2bG2k/VlVbVYQ25HiNCyfKuiSwB1+5t4d1M4ej5EG9Jhc+lJDqJwOkE+68EHr8ZkASwS1P0
	9kyCwuY2i7Q62RPuLaD4TbxImd8De7AlW9mPfAQz7zqw9RPk4EBS3Ipfv3AHMCExmDcKZ//97cG
	70oSmY5y+cpbDoFgsJDc1ZbNUpo0QGbrOjbZi9MtWss5CI23BifFk7nxsFt4EG/4rAuCXGskgLd
	l4wKhGg3VxTFGoGkzYRm+QmReFvRgqWgsrxKGlgsyOI0/I6yFNG5KUkJ7M9Zicr8N4vF0=
X-Google-Smtp-Source: AGHT+IEcsB4SsohMiuSMRBVsLyNXjKi7YpKhM33MGaetXAZYk3yBX6k/E4+lyPkq3E+DCl/tx3dVDg==
X-Received: by 2002:a05:600c:1c89:b0:479:3a8e:e490 with SMTP id 5b1f17b1804b1-47a8f2cb09dmr38671305e9.18.1765565324767;
        Fri, 12 Dec 2025 10:48:44 -0800 (PST)
Received: from smtpclient.apple (bba-86-96-93-57.alshamil.net.ae. [86.96.93.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f3240fasm47202405e9.0.2025.12.12.10.48.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Dec 2025 10:48:44 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 1/3] dt-bindings: dma: snps,dw-axi-dmac: Add CV1800B
 compatible
From: Anton Stavinsky <stavinsky@gmail.com>
In-Reply-To: <20251212020504.915616-2-inochiama@gmail.com>
Date: Fri, 12 Dec 2025 22:48:29 +0400
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 Chen Wang <unicorn_wang@outlook.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Longbin Li <looong.bin@gmail.com>,
 Yixun Lan <dlan@gentoo.org>,
 Ze Huang <huangze@whut.edu.cn>,
 dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev
Content-Transfer-Encoding: 7bit
Message-Id: <A0AF03A6-1F0B-462D-A088-3B4DF6BA6292@gmail.com>
References: <20251212020504.915616-1-inochiama@gmail.com>
 <20251212020504.915616-2-inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81)


> The DMA controller on CV1800B needs to use the DMA phandle args
> as the channel number instead of hardware handshake number, so
> add a new compatible for the DMA controller on CV1800B.

Thanks a lot,  Inochi. I've tested on my Milk Duo 256M board. 
Seems to be working with the I2S driver, which I'm working on right now.
No issues with DMA interrupts anymore, DMA router used right channel. 


