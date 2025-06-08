Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7578C26A0A7
	for <sophgo@lists.linux.dev>; Sun,  8 Jun 2025 23:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749425408; cv=none; b=NjqJfb85BBBl2ljPcHY06vnb33noflVYtGv0OvlXyWnOucZ7xzKV8adDGfBiuwlMiXTXMl3sEiy4Xq8H544H1obQbg1OMcHxbb6zHtMqMjTgr3WxC1aRNYyalAjtk6IVIrCdJOhLn68Jc0Gb/oH0d55SOSJdQ9GRbtOAhd0Kq1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749425408; c=relaxed/simple;
	bh=MWElUnMvqvOdk28WeZ3kixapSyP3QUlNs0cWd7Y3wsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PNQfTb+AIcFf+5iIm44ITXwLHmFh0agv1IICiszS+GEZ5caR/CD5xCufrIDgVlSKRzuZs1hlXEP/9kPQVrouWFxjUCIMVP9ZuyixhwL6e3iO1klp28ttB36Qhp00wr2i4ROmX5/omaC+eiA2b4vIQc804ozPNIrlN1MHRwTYhUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XPeAK71i; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XPeAK71i"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4a58ba6c945so64438241cf.2
        for <sophgo@lists.linux.dev>; Sun, 08 Jun 2025 16:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749425406; x=1750030206; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MPhc4m2BlLMTsqjKbpZeSk/tMLZcSiM106HiMt2a30=;
        b=XPeAK71ioQBOqOD7tRxhOLzXBrguNFqa1vAeNEcYFv7R33QaFshPeZ9s6Y/ue5j43e
         12yTYL4kc/QOaCR+o5g4pQDzAefATS0L4NVCHdB3nnlsuw3ntEcBgk9FhQBLc3CNXZfp
         OUzv5uDaBrPse/w+1e0HWyef4JVtd0kRqYTm3qKTmoaZI2aarExA2MzSExV+TwZKC1V5
         o12mLj2iE1Esl5JBvx6Oi6Anw3o1tnJDdZxuH3+aNhv138zZ5Arn9+e1hHj/dWrpqCxf
         QLo0pn9/miFJDdfq7q62zZ1vt9s8KdpIaclQwLGNiVz3yKfBeYjqDD7+BgCmLClFCBUv
         kwEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749425406; x=1750030206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6MPhc4m2BlLMTsqjKbpZeSk/tMLZcSiM106HiMt2a30=;
        b=xKqhpBQEDPeKXffFqeCkWnKHB79hfy3FsOVWQQtn2sSX8vS0WNwnEaRFjcQX30thnY
         jeGR1j7nvoA8h/633X+hWBtJN676f0BA5vM+hxxNGefMHW8tOJYAvUZfa298Jm1iPD9G
         o+KB8Ptvjh6TRfJv8g0PsqhkCn/7PkfifvN/6sHTxdHrsw1uSo6N3yKF5hMQUTXoChv8
         b6gg38OTxXNSLbh4a8XB9/QZeNuQbfedlii2UxgYfIdGgQDErcqA/LsK4SBJqPyg5TKk
         NdP8DdcpAVqBs2krFgkE5OYb1JKtxkJJhoRTI3fKw7EC7MMarxCx8bQExNfDg2KTQwQc
         wS3A==
X-Forwarded-Encrypted: i=1; AJvYcCWum2/Zi5hS9vnLitfHrkdZDMUlML7mEAT/RthBbbku5ONIayzjn3HkXA/xSfLiphKvQ90YwYU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzk5bmGksVt1Umtrd0QEpEI3+TviWDKiuE3bprIswiPdiQzHkdz
	8+J89SmpUQh8cUdr2q2a2conShoHd9c1S8eCeSWBc4GsOmrFITE3Vfr1
X-Gm-Gg: ASbGncvVOH61vQcX7t/biotZ8dJROy2FMh7ozdAcZVyUTmepR17a8S3qxcr2HnPUKRl
	bkh05HWj8udAy0M4QsMdFTd7llgMp+zdN3qPD0VVlYmYeDRO8V7QAh+9s91EN/ipb5EyR2f4EBt
	paluDuclSdg8DuL05CSakvuUn/YJnFUjqg3/2ok0dhWJQLpg60Wfm0mY2Lj9p2hjpTzZgUnuij+
	nv19eNIG+uZ4KlrtMTpXC4zf4zXfzwVhijhueeK999at/LjkowgVCGyCpww9/vLbTXolDWDvInY
	YsbGN43UngAfrUMgkD3lPzVjgeQ=
X-Google-Smtp-Source: AGHT+IHStic3inQZFI5nmv82JIFqhS8ZN7gZGzEplcgmQgDRVr59jgDMXWjQUVqyNlZ6QMJ/fIJ8qQ==
X-Received: by 2002:a05:622a:2606:b0:476:8fcb:9aa3 with SMTP id d75a77b69052e-4a5b9a2891dmr263302531cf.13.1749425406381;
        Sun, 08 Jun 2025 16:30:06 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4a6fc3c36f7sm10256631cf.66.2025.06.08.16.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 16:30:05 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Longbin Li <looong.bin@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 07/11] riscv: dts: sophgo: sophgo-srd3-10: add HWMON MCU device
Date: Mon,  9 Jun 2025 07:28:31 +0800
Message-ID: <20250608232836.784737-8-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608232836.784737-1-inochiama@gmail.com>
References: <20250608232836.784737-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add MCU devicetree node for Sophgo SRD3-10 board. This is used to
provide SUSP function for the board.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
index d077923097e8..75564b2719cd 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
@@ -36,6 +36,16 @@ &emmc {
 	status = "okay";
 };
 
+&i2c1 {
+	status = "okay";
+
+	mcu: syscon@17 {
+		compatible = "sophgo,sg2044-hwmon-mcu", "sophgo,sg2042-hwmon-mcu";
+		reg = <0x17>;
+		#thermal-sensor-cells = <1>;
+	};
+};
+
 &sd {
 	bus-width = <4>;
 	no-sdio;
-- 
2.49.0

