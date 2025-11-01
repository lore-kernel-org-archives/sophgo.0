Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEE2241CB2
	for <sophgo@lists.linux.dev>; Sat,  1 Nov 2025 01:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761961469; cv=none; b=jYI502I1oJkuFNvupI2cAk8bdZuPcrEQonY68gVhoJpP/ttXPTzHxjK62mQ42SwpoKVqHeXmqjpbbmKEzhQTnHZapiYuVHD+DRAWoLk/lIQ73mN2QSgoM1FolYAngBVtVe/3tHomBQE6kCIb9PPW+xnSaeiipH8AIlhAdfvidUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761961469; c=relaxed/simple;
	bh=WcntrjdIH/F2vHrs974aHaeH8m2rMck/WuuBmWZWSOM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gv9OkyrO6Fu0I1dWFEXFaTnhWKlPpp+C9Vm5cgL7NUv4VCzULeTe4INCmS77O9n1DbqFXFiYrgi77whFvRI81yVE03NDAzgjs4BHljHM0aAxWFEeD7AowLIy/pToiGc0+LMlvE4HyChtKfeq7l1OhoT4PDAZSmy6tv5aFXn0KHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SKfYK1gh; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SKfYK1gh"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-794e300e20dso3220024b3a.1
        for <sophgo@lists.linux.dev>; Fri, 31 Oct 2025 18:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761961468; x=1762566268; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c+fhVqu0PV24AlJRQZwkBAzniqnqOKuxZL9zcVIrjpc=;
        b=SKfYK1gh46937Sn+qDT4vpKA1p2hH4D2G3+VSdaRhf8Yuo7csWsi9sZLNUzpyc5pEr
         tzhdqMq9Y2VcLinqVsolhYhCiqXf6waSEVuMeRAa9PCy0tPzAU5p+9cJvu9dKGB55lta
         0OV2EcDoaSQWcB2RU9TO+SCt7UTKvOp8ps16qNuty/AFfBFBOmJ+WyBLOQm1GlEi5OQM
         Cic86rNkMa+bKSjKX9IPCh7vpOd1rzqL+xHjxDNe/zURaeASeNUDryc9FvVWCkYZGCWH
         +JCVaMJR4RpE/pXIQB9CKdLStG+50/8jIaau6mUuW5FUgsSrS/2w1D0Ih+At5RZC4DUb
         Wdyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761961468; x=1762566268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c+fhVqu0PV24AlJRQZwkBAzniqnqOKuxZL9zcVIrjpc=;
        b=q9I94nPIB//QETaLeYSwY1ei9IgG9imSWx/yISpCuQlH7SwRo9SkeeBqWIGosLG+fd
         mNtVg76Uu+xEkOJ3JpyXDvvllXrwEthoimstic6Kw9BvA4QsSoZvg/eieUKjpCdsRPrv
         0Xw903SCBuishGKq6Pp2pPso/x+QU5itFEIHnn+eBAE6ZLhrV7JE1f7aKklqD7z8g90g
         Sl9eu/84N3JB3Ad/nZNUi4eF1cS8NrNSLaW9YUD0b6o155T49RSQqQf86o+MDVgRbh7p
         7opwdbquB7GJ8J34PEfvQoQvtWaAwzf6ZzOwy99zq1i3Ea6e5nkCSXPivkHJv1Ii9iD5
         EA1A==
X-Forwarded-Encrypted: i=1; AJvYcCUlcBfeUSs+EaMxC1HnXhY/wv2DU3j9T5Sni/p6d62BN/HdFoxj6JYCaM8lAauZAswYX7RX9vU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxywK6qOypaI9RK9v89QarKByvSI01SysSFfRDZYpYmyThSy1yt
	zjB/wON6h/Dt4BcqTdfQMrajqt/zYlaKFvzVcecL/qykUtdGzWRQlTh8
X-Gm-Gg: ASbGncvBsHaExtcszAE05KSLDEV3Ttni8OC+Zkmh7mkM8eybZ+dz/6CDBtBaH1UfKLY
	SSCMx0t2mzQ4NcRx2R5zzs+i08BBFz2WJMGkfaEZqPBPSLLYLhsF2XQpThCXJWtt+sJr13TWdwW
	klyNOqWua8zFihSm/ApaQi/PHc/e3y+aZbnAQ0FqGCXHnLcnpS5cnnsmhTzUCFZBGNTIz+sExR6
	bLxGBOfhWCPmEeTEgUzoWz+gehIL34Ban1s1wexWvC5c9w7ytvr9Zsa9gRDFWnwlF1sqkxeLNFw
	4dsbitbCGnnFQ178iEuANHAlmFbnsstIu9UwHYyXsxVWHQSYPWHkds09Rot2HEV7r9yK++NWBzq
	N5XQroAygYv9Z81tF9g2qzKdNKhGlFQ06WyVQ7WiryoMNHGIV9D7SnDU1q4qgKAVbCXVaXbBC25
	LIjS+iMLU4bCM954ibUbAfy8+Lnbw=
X-Google-Smtp-Source: AGHT+IE+BkF67zbvd+SI0Yp+p5eLlXzV4Z8l0jiZti7LH+X2mQ8UpPDNY8rSxKA66iNjrb7ZffhF6Q==
X-Received: by 2002:a05:6a20:9f48:b0:25b:522e:52c6 with SMTP id adf61e73a8af0-3477a5c1388mr13176935637.2.1761961467632;
        Fri, 31 Oct 2025 18:44:27 -0700 (PDT)
Received: from localhost.localdomain ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93bf078924sm3350585a12.32.2025.10.31.18.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 18:44:27 -0700 (PDT)
From: Longbin Li <looong.bin@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: Longbin Li <looong.bin@gmail.com>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 0/3] riscv: sophgo: add top syscon device for cv18xx
Date: Sat,  1 Nov 2025 09:43:20 +0800
Message-ID: <20251101014329.18439-1-looong.bin@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add top syscon device bindings related DTS change for CV1800.

---
Changes from v4:
  - https://lore.kernel.org/all/20251024030528.25511-1-looong.bin@gmail.com/
  - Drop the labels in the example.
  - Drop the patternProperties.

Changes from v3:
  - https://lore.kernel.org/all/20251020083838.67522-1-looong.bin@gmail.com/
  - Corrected Co-developed-by information in commit message.
  - Fixed patch version number.

Changes from v2:
  - https://lore.kernel.org/all/20251012022555.6240-1-looong.bin@gmail.com/
  - Add ranges property.
  - Use proper regex in patternProperties.
  - Add complete example including child nodes.

Changed by RFC:
  - https://lore.kernel.org/all/20250611082452.1218817-1-inochiama@gmail.com/

---

Longbin Li (3):
  dt-bindings: soc: sophgo: add TOP syscon for CV18XX/SG200X series SoC
  riscv: dts: sophgo: Add syscon node for cv18xx
  riscv: dts: sophgo: Add USB support for cv18xx

 .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml | 80 +++++++++++++++++++
 .../boot/dts/sophgo/cv1800b-milkv-duo.dts     |  5 ++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi        | 42 ++++++++++
 .../boot/dts/sophgo/cv1812h-huashan-pi.dts    |  5 ++
 .../dts/sophgo/sg2002-licheerv-nano-b.dts     |  5 ++
 5 files changed, 137 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml

--
2.51.0
