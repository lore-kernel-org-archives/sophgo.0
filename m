Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071E2189F3F
	for <sophgo@lists.linux.dev>; Tue,  8 Jul 2025 06:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751956251; cv=none; b=pxL0DFakKRAeVY8MBUu0KDDGolPeTUx2gyFu1sJ3f5u5kyxc4xOCx0AWCfKrTvdOJY3nvFbZBOAB+MXKEDEzkjDPDlQvnUxLNpEvxFjQHC6z+cPMbYtcsff1L2M79lP6MgFtkuZdz9jmkVnlwIG2yx4dgActmwOp0OcaZb0ng1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751956251; c=relaxed/simple;
	bh=1Zka75bNEvXEduKJP6vEIX1BbDz+ii0kbMA+uIdNB/A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZhZU0/wsgioJKN7PF0pFK7KdJixPEVoWaRAGu/ZsRFtevWP9+ESqlLOT6J1z1XQW1yzn3N8aaFuh0oAgtu3dTmIEGB8E5wWozz5tOGdtrXE7wsG6yU7SKcKZBRLNCKwog2+8uENI65McC+hN0FP610aHUYIA2k4u3ZEZG2r6RJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EzKrgbRY; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EzKrgbRY"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-748feca4a61so2151893b3a.3
        for <sophgo@lists.linux.dev>; Mon, 07 Jul 2025 23:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751956249; x=1752561049; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NTSaPd2KsxbQLmtDO+kQIyiudpoUlJNATnX1VXPLxSg=;
        b=EzKrgbRYTXeNlATavfLejbGMetb4JVmJVDaWc7pG4TCIyre5KozeHhrx1WNTdVR8Dv
         TSQD8Ms7LOILfYj0Zc9ZCubWsFrGS8VFwf1Fznz7xpayCUG2C0HfzarEd4eu9BGpbIfH
         KB2IxQAMQ74YKRztmSxP4WbNJfDqPaVK9jtUc/kXmCzqG/m6KGv1qphyAz8vYEidrkTQ
         rtN54p3Q2+DgZ8vDT16uYpGahZ9UnOa7jCuYDXoWQm9Ssded2l/nhrkN51rUz6TA3Zbs
         /ljDX0ZT69YTUPkwe4lhtI4WJ2bChkp62IXsjJuczkhDdAFbbFwkTP7jwBebBFH+OCwx
         qqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751956249; x=1752561049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NTSaPd2KsxbQLmtDO+kQIyiudpoUlJNATnX1VXPLxSg=;
        b=uerAdfWNbR2Fb0HIr70m1xsmVLiT61OJF8oeU4IAsH/YLiyKqQrUorWwQxNaNaOANt
         SQOsB4opQ2Jcnfj8GSJ4DslaiLei9yaJFWxr6X47QhkLzzCgObXIy46e9NRmJu+uQ0dg
         Lt0QvggRZ8mDVp3Z2lSlPqnXeyk4BP3iZz9+qpzZ1yvUHFpydPS9ZH5+yEyRVK51M8j6
         LiETsl1bt46yGkl9oT7OiqeM6pdhKu2cn9ne+Ske1tAJzgfVzAgNmozW1RdIeRQnPt+X
         5Qh7jTg9LOf4tE4rhF8HziKFL85tkq3grs1si7IoiYW8OPnZ/BRbb50n2U6fKtkqKM0B
         uC0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCTD2JelEDW8tB0pUNLzEs941dyGhbRFdMPHGeKIDXZSBTY88l97c4nQn+NVV2ZlOY3tU8Amc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxn7B8KQg9B7UOpGksw9YG26NHlq36XNkJnpvjOTqiWaA/sGRKz
	IAXyDg6l2sxlXtYE8ssO6KBelGXopra3vClOUYxr5LcMWFv9Qz6XvZgN
X-Gm-Gg: ASbGncu6eCk0FC2Xp1YSwSvXWodsDnhid6+s3qnOeFEth21ZSBumOQoe1brng787mvc
	exmKL+ux/rV2YJwOXvLrvKfoJE+fg7UNJ6+ziT176vzo2nfWna+jAU3CUnQnCg5Kh3/bwik1kH/
	M/WHnH6OrQY9jzMWnQtt/JG3JdmpBnRCtdTpqcr01AgSdV7k6y3Gc2V+PWIJo0P8EoSD1hTSoUZ
	OvO6QJvLNEZwkmSvDyQSyCY7IXsKj+Nr1ybwNuPmIAopRDZS3WwKlSGElnFInGylD/IVmJMyAAG
	x5pIvTJ3pQlebQaZKYyA4PZS1HpIjaHtQ7HuklM8jzpI3ATwQaBoQPu+Mmr9AFVr0YUqJbpn
X-Google-Smtp-Source: AGHT+IF2gopwxM64FAD0FZDnw1lPgQORZkvtpUYpoRgRuNfklUmt4fK4rmjd5HBaL3Snj8yAGWBBoA==
X-Received: by 2002:a05:6a00:3cd6:b0:748:3a1a:ba72 with SMTP id d2e1a72fcca58-74ce8acd777mr21400752b3a.20.1751956249103;
        Mon, 07 Jul 2025 23:30:49 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74ce42cc925sm9765276b3a.152.2025.07.07.23.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 23:30:48 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v5 0/2] riscv: sophgo: add USB phy support for CV18XX series
Date: Tue,  8 Jul 2025 14:30:35 +0800
Message-ID: <20250708063038.497473-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add USB PHY support for CV18XX/SG200X series

Changed from v4:
- https://lore.kernel.org/all/20250611081804.1196397-1-inochiama@gmail.com
1. patch 1: apply Conor's tag
2. patch 2: remove dr_mode debugfs entry.
3. patch 2: simplify the cv1800_usb_phy_set_clock function

Changed from v3:
- https://lore.kernel.org/all/IA1PR20MB4953C1876484E149AA390DD5BB1D2@IA1PR20MB4953.namprd20.prod.outlook.com/
1. patch 1: remove vbus-gpio, switch-gpio and dr_mode properties.
2. patch 2: remove all logic related to the bindings change.
3. remove the syscon header file.

Changed from v2:
1. add item description for switch gpios.

Changed from v1:
1. remove dr_mode property and use default mode instead.
2. improve the description of `vbus_det-gpios` and `sophgo,switch-gpios`

Inochi Amaoto (2):
  dt-bindings: phy: Add Sophgo CV1800 USB phy
  phy: sophgo: Add USB 2.0 PHY driver for Sophgo CV18XX/SG200X

 .../bindings/phy/sophgo,cv1800b-usb2-phy.yaml |  54 ++++++
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/sophgo/Kconfig                    |  19 ++
 drivers/phy/sophgo/Makefile                   |   2 +
 drivers/phy/sophgo/phy-cv1800-usb2.c          | 170 ++++++++++++++++++
 6 files changed, 247 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml
 create mode 100644 drivers/phy/sophgo/Kconfig
 create mode 100644 drivers/phy/sophgo/Makefile
 create mode 100644 drivers/phy/sophgo/phy-cv1800-usb2.c

--
2.50.0

