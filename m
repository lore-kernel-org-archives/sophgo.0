Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD24C2E0
	for <sophgo@lists.linux.dev>; Sun, 12 Oct 2025 02:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760235974; cv=none; b=YlJ48cL6EYD2+xW0PFrgiXLVsN4rhMZvhWCHU8X1XkPO3c12Msvv0x2EE+nFcXtDVzmNRY/dUVpZalHyEZ1iOB91QmKtR7rlnaIpIH3TRXHyQipxhtWtWqMMoWxvQ76h0NIRqnVteayul/QWwwOz/YiXncio+nkXQyx8CQT5eaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760235974; c=relaxed/simple;
	bh=sZlWQ+Ehq+TFmw/e0r2RP5C7hm4PItV+0AnNbZePiLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PJPjIvVR3WYWGpu7BV4uCY8jdK2BpFQCunS/SrJX4lSglVYJJtxV5Scz60Q/4iCV5PQ5hDkVexsy7w6lMF7EXdZW269P/6BBFEDAFHCjKlfHpcup3EojOLScX77ivRhUb1yMq7LSBXSqIP8fPtkOuBb5CgXHaT3tJ31/MtWxrgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i5b4uL3+; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5b4uL3+"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-781206cce18so3288757b3a.0
        for <sophgo@lists.linux.dev>; Sat, 11 Oct 2025 19:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760235970; x=1760840770; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Y+1XwSbsMVPSTNdYmAt47Cu/9qwf4w36EkkfnGxXMU=;
        b=i5b4uL3+qBUgG8VK8je+E9Yk/NqYCN+kA4ZaHQLvLPvYQd13BelPiqlhkurBlzIRCd
         GilgZrQCqDIjicZyVBHjFL+p/oe92fvN7Rg9jgMTfs7nhRRQ4k4ogs/koQldpqYqC2rp
         CQ57fUSgENFoVaGMja8oFrcuGekkBhK9+l6nTRDScgVM6jl3YBpiK4ZjnW7Q0P8iv9qE
         Nzko6SkQW5kqAQ+MrAJXiiJR8oTPrYERRWw+KN0HVf4x6MnzScqTsls94Wga+Mq/ipFu
         ASxlKpJ+kwlqdoccHY8ZjuwLogfwNbHvZ2IvNxBcrxMK1SnNsEMxQ3N32iV4bQBy5B1y
         MFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760235970; x=1760840770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Y+1XwSbsMVPSTNdYmAt47Cu/9qwf4w36EkkfnGxXMU=;
        b=csEXBzQFEpUcf1qlYpH0eoI6iEqYRqKqhxYfx1LpMWJHGzxiQQPF5myp5ZJhW/WWz1
         E4Y+sgzNNsaxxkF976/nnPedRcLi63keaBrUUTH0cEYbm8kOKRgsUZvKQQtc2n/WdfqG
         KE3P0o6X9gKsGQ74uvmU6+WVieEKgIPpMWeKmM4MnZtwh0J1Z8o9yrcVug9MB/Ffboil
         Lz7fxI6x4oCloFkkrLn5g3iOekj+Sf9fawXgZ/+vCH9kEFl/kPCiL5YTAcyKFm/yL3WX
         Cm/e3NS8EUPDPp3ZwXr1j/kXD8TQngbHWJ247uNTqqhV2hDMdE1zjVNAp+6qRjC4Tw8J
         VZjA==
X-Forwarded-Encrypted: i=1; AJvYcCXI6m+R+iZ56zb1f1w0Sid5P27NE24wbLTHDd7eQtB3cqYl/p03Gxfdk4ccvY6++wDW7wi1tbc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyj95e89Lw681j6NdH3YArGE+u/lnoZe3oBH7znYD82V4RfUsG8
	r5lxLy9Ps8B1Q9V0kOH+DBhY3GsfrZFsFdX2Lyj0xJbR99DyeUOJbBxX
X-Gm-Gg: ASbGncurQIM8figXco7XK3ThFaDtrxgYNVyGPP09eiP2gnQcxdO6tQn9LUXjYo4WYBO
	KwPnGFoknRO1YlSJ0fisuLBuSVx0BaOXoncZRlh9O6cLyQ1ksnjpo3nYjguEHOHJIjhzt2CECZi
	cBv+PN/W+wtS1vblZUm0HGpSYP9hgdNHVqztHxGlwhdB+/ts3kIkIz+pibECi3zhuGH4/OPAE2Q
	5AUutGqtJ5pS4Cfpwkm0TJUCe06YyCjvJfljvetL7Q+24nc6h+ZNJgoBz3vghZVCY2Ptv1tNJEn
	jnHxQMbTOl6vQvfwEqQWSiPZTZWi/2uMI61P/MhaWJ0fnGrFROqevGTBt6hKuIqa5/J7HZ2k893
	nyvft733g41LQISTaG/Qp2s373QzuXHSsAW5B+bhqIX+kt4QKqEjdYdmv18arx4LYpiEb
X-Google-Smtp-Source: AGHT+IHTAezIVOlurkAg+7C74kvmB+nBt5xlXqzzzPRnJHFMzlSR8jL/NpvTl40u3+f4D1RCNQ2gDg==
X-Received: by 2002:a05:6a20:3d95:b0:278:bc13:d83e with SMTP id adf61e73a8af0-32da8e360e0mr23314655637.11.1760235970292;
        Sat, 11 Oct 2025 19:26:10 -0700 (PDT)
Received: from localhost.localdomain ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d9992ddsm7180489b3a.80.2025.10.11.19.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 19:26:09 -0700 (PDT)
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
	Longbin Li <looong.bin@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 0/3] riscv: sophgo: add top syscon device for cv18xx
Date: Sun, 12 Oct 2025 10:25:51 +0800
Message-ID: <20251012022555.6240-1-looong.bin@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add top syscon device bindings related DTS change for CV1800.

Changed by RFC:

https://lore.kernel.org/all/20250611082452.1218817-1-inochiama@gmail.com/

Longbin Li (3):
  dt-bindings: soc: sophgo: add TOP syscon for CV18XX/SG200X series SoC
  riscv: dts: sophgo: Add syscon node for cv18xx
  riscv: dts: sophgo: Add USB support for cv18xx

 .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml | 59 +++++++++++++++++++
 .../boot/dts/sophgo/cv1800b-milkv-duo.dts     |  5 ++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi        | 42 +++++++++++++
 .../boot/dts/sophgo/cv1812h-huashan-pi.dts    |  5 ++
 .../dts/sophgo/sg2002-licheerv-nano-b.dts     |  5 ++
 5 files changed, 116 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml

--
2.51.0
