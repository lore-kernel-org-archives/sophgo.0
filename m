Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B1133993
	for <sophgo@lists.linux.dev>; Mon, 20 Oct 2025 08:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760949555; cv=none; b=W/g3N8tmZAzgmK34Ul5RfSiahNMK2aJDkNpO8PRIjPAFfPZjvnluOWJHsWtmNpL9CNx7RUwQNT/+1mZq60APqwzq4iCrEBBp/eJxy1b9qvutr67YaEjpY9CIRrwVM5C4AiBFPZF1tle3pD6aj/QutzMXmTbT3e6ZOxKDoDpQeIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760949555; c=relaxed/simple;
	bh=Ln1cpTJYDMfYJSK2ETGhBkeC8n5lFPLWaYaKEejfbjg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q5GnNtGHNqnjJKAFwYO0ByAyIKuvFYA5DA/McqtpvN5jCxcNWLBMq1/n3zR3QejvCdcV8u/ruyaLsrr556XmvNhUU8xmHC91due5uWJr9dhV/iM19aag5xIKJ0uRt9oyb8g3gH9odHIHKPc4czC76fkEjntqB0FD5W6/kEokKeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kpzZWHGe; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kpzZWHGe"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-791c287c10dso3153352b3a.1
        for <sophgo@lists.linux.dev>; Mon, 20 Oct 2025 01:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760949553; x=1761554353; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lC0+koW9LqBuD2DjLYQLY3ByhReVTR9v1Ofuem5KTnM=;
        b=kpzZWHGeurmk2ZFh5edLa/ddw1DgHtIZEvQqeWtG3qQGcgrOdfWYgGQT5UD1YENiPd
         mosf/Ul1qGOawkbuzultEPLrQWVwnUSaDicQeFPKq+viJvtPR01ye63MFUXz+gul2+Xn
         sy5Lr1rImPF7LgYTfpOqU14hTrbaQrRHTShgi2eC3M5NamokQlzHsWT8d+5H9QRVaFFy
         Yo0mfget4T4SerqYYDxnOt/fMy2dPhlHuPfOu/MaPjJNIYil4+/wanf4i94dd1bY9RPt
         PNwurqk3TZJr2k66xwlenznZesduJiuLpAXCCH95AuJmGPzDByb8UaOa53Im/5HBSCkz
         TmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760949553; x=1761554353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lC0+koW9LqBuD2DjLYQLY3ByhReVTR9v1Ofuem5KTnM=;
        b=UMcv6qWlWK0USGkyHkkL2ItRN/F189kFzEIA3Uk6LDYPYe5gPXGXaQ6ctJrqmzElYU
         s5mweLLiadnI5WaKX5YNH4xnyJ268SiEJ1hxtu+HZzMpRFkV7M8AijQ1AQW/2JUWQqLC
         gdBmVItNUTiXn6gr+9WrvoNVXvm8UMrX8xZNtydf6Z908nTz/uYQXYX+Oh2N09UiHAUS
         V6+PaULFBzfwpwYHVCXtAKbsuxwd8WVovSqkUe2hWM5bovhSYIJSarMy1uJS36QSgCXL
         H3sfG4HFctGbvHaDSsKxTS/P7AyZ62csBucjzuOBNFnh4DOf9KL0IShfOsaTUSKWhtB7
         yHzg==
X-Forwarded-Encrypted: i=1; AJvYcCVymW1USyDP1mqXOdVjcUQKiudJzOpvCzHyimd8sRLQilJgbG44QN+YwMgN0aUh/Mc9aQSZftU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1s6PCrInAslM3tKlXlOnC/0pXXiHlQPHTTiMQwdHYjRszS75x
	7CD/Fs7WlodzVN+RFcKyL+MIKAucv4ikITyObS8SknBAyWghQjV0tNlo
X-Gm-Gg: ASbGncvCT9K0qB1Pc9fAreKY0AlcbF9qBakTDLg62BoHZQlc/EG+vt17/X+isusyCTV
	iO3OaZbvJsP3kiQw4DgsS1NBbqQCx6+GLGQPpaZDUvTDNm87x8L4fARldfcbdGVWsgVQD5Z0ZmS
	JFfkHOjict9cc+SV8xp2L9hgohNpBlWnr8awYfAonh0Nq6nMW74qs/Dd9T2CDaC3BwdyfWRYIFh
	EOE91n9tY8Yk5y2MviKUCBjLUp3qhwYaMXYy+QLrSLg2IQhI1n4dhDoVjueTeaNyrXHGf1P3vjd
	B/PLbHvL4Kf9V1csWOh+C+iTnlE+c60/0dE35OTYXYf4/+YXG78lq6+kH1mB+q6GBFpCKSfZLzi
	FtjBJ+VUHfgRnMTZYRh95r+UbNAlA+vAU1MuzOTCmxAGmJ4DtvVulkkW7SmkUDNLv6BPA0LFzZe
	NIhyRwAA4g0i/t8sii
X-Google-Smtp-Source: AGHT+IFfolMgNTgrjg6QCUPSwye2gWTgy0cB2CyUntFytqmxf6KYJJHGK5kXGlssp1Efpt+QdGtvtQ==
X-Received: by 2002:a05:6a20:9144:b0:2f4:f041:a065 with SMTP id adf61e73a8af0-334a86103e8mr16827774637.38.1760949552820;
        Mon, 20 Oct 2025 01:39:12 -0700 (PDT)
Received: from localhost.localdomain ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76b5d0b4sm7062386a12.29.2025.10.20.01.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 01:39:12 -0700 (PDT)
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
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: Longbin Li <looong.bin@gmail.com>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/3] riscv: sophgo: add top syscon device for cv18xx
Date: Mon, 20 Oct 2025 16:38:30 +0800
Message-ID: <20251020083838.67522-1-looong.bin@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add top syscon device bindings related DTS change for CV1800.

---

Changes in v2:

  - Add ranges property.
  - Use proper regex in patternProperties.
  - Add complete example including child nodes.

Changes in v1:

  - https://lore.kernel.org/all/20251012022555.6240-1-looong.bin@gmail.com/

Changed by RFC:

  - https://lore.kernel.org/all/20250611082452.1218817-1-inochiama@gmail.com/
---

Longbin Li (3):
  dt-bindings: soc: sophgo: add TOP syscon for CV18XX/SG200X series SoC
  riscv: dts: sophgo: Add syscon node for cv18xx
  riscv: dts: sophgo: Add USB support for cv18xx

 .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml | 81 +++++++++++++++++++
 .../boot/dts/sophgo/cv1800b-milkv-duo.dts     |  5 ++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi        | 42 ++++++++++
 .../boot/dts/sophgo/cv1812h-huashan-pi.dts    |  5 ++
 .../dts/sophgo/sg2002-licheerv-nano-b.dts     |  5 ++
 5 files changed, 138 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml

--
2.51.0
