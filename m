Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2982146D53
	for <sophgo@lists.linux.dev>; Fri, 24 Oct 2025 03:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761275159; cv=none; b=czo1h3ZJPw4O8iptkAVgSEPLKgG6kIHzzwQI5/WNLI6zvDX26UsChguPWoBkNNxz3px+4poAQGADyCxJBMkX8URjmSGhDlJdGieNZpZsJEurWGdcJ5WDHTQw+rF4zdZ4qi2mEfFcuH0DinkVijqISJu4jNnpa1rx9+zwZvhFHkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761275159; c=relaxed/simple;
	bh=4FHl7ZtxkDyyaY2ICzAcXGfZZ9UdpflrdhShRLPsLfE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p5ubi5puLkk4tblsEsBUWHJA6fGNbIPehdQ+CazRnQge6HgpOO6frTPAVHd8dGInf2wxaXuzgItS4NZBm2bA+Oly77uLAix90et1aqFn/EFMMrYJ3ooEJDtC53Qg2JTchQemk8dYMY9t4BT/SXPcrOh+YP2Nih2RwfZJlP6ycFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eeV2MgoH; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eeV2MgoH"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-27d3540a43fso14952865ad.3
        for <sophgo@lists.linux.dev>; Thu, 23 Oct 2025 20:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761275157; x=1761879957; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4EzmryWBAlOE+6PvafZLTL8RGcukfyVnYUGcNucBOXE=;
        b=eeV2MgoHp4NltE4Tc4pOT8G8X08Gj7otTCqdbTI68cDxHUt6vKv3flgFZvk8HeMhPZ
         9mjPeUnoPPF7Sq//TkXCTRZaP/TIJfz56obocgeNyUomnP3MDNvJlLnype6O4xc5lD0b
         AfbmOGe6EQkMN7gWPsWu7/rdns22k4IUe6eSgEPYiFJbj4rE9GjANMsVdYz53qq3HDc4
         bGZLr+s1JLwb2eduArd4tyvu/lFGHabu/rOhjhJ3cX08CgyGAYprEs03MFy2ON8A1dB5
         XyO5ml/EiBGLD7/wbYXsfTTFu6m2p18A9zi/VuRS63rwrcs8/fFrNjF8007urdMTRLpT
         t0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761275157; x=1761879957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4EzmryWBAlOE+6PvafZLTL8RGcukfyVnYUGcNucBOXE=;
        b=s8hRlJNb3QSIvjoSgOYGDXkdx+oBjs0zgprLX9oC/ALwWh/RM1nG2lNNTimNvToHeI
         BmVDfmOwFHWtQuDIMcAUqpiTzLKrCMN+4TKeuGKIcl0rmm+cqJPm07UeDJsJYJGr5kXj
         UXupOUxchj4V2I+Kf6/vOoOvUIBbzW93qGk7EzUuWzVGt2zVhRzfmVtlrtVTXQC/KRfp
         OUjSXuK1l/oeZPlb33o7iUpeFHBYhEpcEqnP9pNfFG8fG8k+eledmtQDxfod03Hiq9mq
         5J4BUa2NPiyK60RiaUBuNRjJ66BY4olgEgmYbgO0GBaevTTP42ZLyoxhsUlA0xrJ4J2b
         ROwg==
X-Forwarded-Encrypted: i=1; AJvYcCVGnYhnBYjN2PjVKKJktuhp8SWCtW7KWXMaWMOGVTR5A7fW5BdC885k6yTdxFPqePTtKtFIk2A=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy33ioWXD7plrwWADZTbKuQ9Pw030djZM7lBHSx0Xk7+Ouk8h7s
	fIJkO2pkgF/LWsUSs8/r5FPIN7A9RoLrrybdybPJIhL0kd5ayztFVFXu
X-Gm-Gg: ASbGncuYLMriDEMqODSJgDxzqwhhCW55wDE++jbjzjYcyXJTj4nc+UH8F5GnpeboJAW
	yMgzYTWs42xB+Tu+qhXqsytL4HK1Ye5ypMnyFDdNRf8Cz31rslv74y22TtFFIpe7audFSKH7gVb
	bmSstRGjbNwiLAYSuUbFXaEeFODoIB3XrYnI6IpxJFlAD4eAcyCNc2dbuSoTAvtPHMseUmZmp6H
	+GVmoZxaaTD9srrfoqgNaTMtff6dZHqVOVXdtwc6Th5N+LQDpU6XJplzHaJD3iABxiLurBPgv3m
	3GTQSACg63EyWth0ZG06lwxi5Lzkrjuw/M7tF6efKodm9tp6gL1D99MieDGKyf8H7AK5bjuJIZj
	iWITXFrhq4/pkj9D20CWLv+qfoQd4FAdm8OFm9eHDGEfH1HBEZZA/Vkv82N0TToyThCmY+OeZk4
	UguVehJSc6SdXPB7Exsxm3yHxeATw=
X-Google-Smtp-Source: AGHT+IF8b4avL0/1iLczBKXPJIE+YBOYlfAMVKvJQQ45ng5xpwwuuzbCszJkZUGkuxOMXW5DM24w0Q==
X-Received: by 2002:a17:903:298c:b0:27e:eabd:4b41 with SMTP id d9443c01a7336-290c9c89eabmr329227425ad.7.1761275157084;
        Thu, 23 Oct 2025 20:05:57 -0700 (PDT)
Received: from localhost.localdomain ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4bb86cbsm3574172a12.7.2025.10.23.20.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 20:05:56 -0700 (PDT)
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
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Ze Huang <huangze@whut.edu.cn>
Cc: Longbin Li <looong.bin@gmail.com>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 0/3] riscv: sophgo: add top syscon device for cv18xx
Date: Fri, 24 Oct 2025 11:05:13 +0800
Message-ID: <20251024030528.25511-1-looong.bin@gmail.com>
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

 .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml | 81 +++++++++++++++++++
 .../boot/dts/sophgo/cv1800b-milkv-duo.dts     |  5 ++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi        | 42 ++++++++++
 .../boot/dts/sophgo/cv1812h-huashan-pi.dts    |  5 ++
 .../dts/sophgo/sg2002-licheerv-nano-b.dts     |  5 ++
 5 files changed, 138 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml

--
2.51.0
