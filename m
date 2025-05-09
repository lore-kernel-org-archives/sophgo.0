Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D2017588
	for <sophgo@lists.linux.dev>; Fri,  9 May 2025 22:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746828714; cv=none; b=FBj+5/uqelKUV9PdqJhX3yJQXIh9FOEfy+KiDQxN5/E1gDe370RhupzFAgEzCD6m6whwdcGnzN1yX4MFNtAgyGhy+TAKG1ByBpv5fP1O56z6iNyQOtQyi2Wus5PdeMWj0xOo81wgZFuE1CmT9K5gEzlA10fvY5/Fkxx2c3ZoHQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746828714; c=relaxed/simple;
	bh=BHScd6W1izQxvNTXr1cbzgrQJUCi9unRwthj2g4US3k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jnLIa2WJRhubp77WSMiIvokNqTN4OHsjMGPLtUJoLEJokbYf4gVqG6i3fbIqi/M4Cz6Qv8prvBLE656HXolQqu3xRy4oY3Lak/jDxlr4Swr9oQEtL/iXK1GjV3pJQ91VqNISunBmdKUImy7ZWkUB0dnzbyyec3x+VEbpTncCnpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kTo5xCBL; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kTo5xCBL"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b239763eeddso1172077a12.1
        for <sophgo@lists.linux.dev>; Fri, 09 May 2025 15:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746828712; x=1747433512; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FNKweaenlKFl0158o8g+44XHhRIJdVv3x1kdDwr1zNs=;
        b=kTo5xCBL8sikLaNT40Lzqo5b9FEL0CDlpbgc4UY9eude/ptR6AI1nQzaY7+AHI2hpS
         h0K5gCVOSy/9GxOGE9iLRTO501d0g5Vo5pFd+Jebeva6sgCFyQ3WW0Yjbui6lDtREDJv
         QnXC9UI/1GLRf9fvlMln78lrdEFM1ued4GxN2i3Iij44kFOfqY8ZKRMNfIOkq2J/3S4q
         06WJ+8wyI9hSg5iXy1LMEDwvGH5U88bfFehh64mhKei+kFVMlumUdCArbEsvjRx7EMcT
         JV88ZJjnnAy1FrCD7i8MSiV4GdTPBOYa1tW5uQotkjX88X8sVxNBk2lDzLh/DObCQudp
         VgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746828712; x=1747433512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FNKweaenlKFl0158o8g+44XHhRIJdVv3x1kdDwr1zNs=;
        b=YntlGvmf4MsaM3BPe3iPrc8S0SkNnNFEvR1RX/0UmVx5pHWuYvcOstvTKzQ4EbmIEY
         N1v7kk8EB/3Wayp/4Qr2sGwV0JjR3DHh+iJ6kK92YwyDfxdq90XaQIWi+/FpMQzuE1Eu
         1aHiPPhr5OVgbL6BG+zw+KJ3BiY9r5zvi/13Z502vTzlRWspg1AUBGGQgwu3g3GcUbCN
         BsEi4Dx5dTCS/FL+JpICEaPjksX1R0aP08Bah03rWGKnGYOOcUcgV+Wk8oTZbI9SamSw
         a/UUFYzJCLKN/3/lKVQFyZ+0Iak5XJPa1h4KRrKw5wBUF7egOMaqvtWlIzQMLM9ADGmf
         DZmw==
X-Forwarded-Encrypted: i=1; AJvYcCVbUB4haOnLz1tmpZfQ4YWKdMx9HIeOp0pymdOf1n2x9BgKu8YSUpxUu34mpJm1ZN1DWE6opfI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6yPm13Qqoc5McTpc4KYBG5b2W8DYeloqdS9CMZrao4OD2frIb
	8sAlC+qcEeONUbL2I9K+LI1E3+BywS6JmsSdiywbusNnl8OOYdo8
X-Gm-Gg: ASbGncvAgwAXTALr+FrqHd/XJd7qr1Fs1yg9e8ajoz5BTqCV4RQWT11f3d/oszB+WNp
	mFXD3rZ21HiUTSJgMdR7cAd0e1sEeGZ+sYrcesM8KNrjVaoaMKsem2cTcV4qLfpbOUfcc5U8N6k
	RwdzH3CqiqNau0kU7FLbCmlqZL7unFPjCp83BaJSJYSxhFNGha5DjXC5Jt/P1JPzet0J4pGSPwA
	xIvy/cWr5ylxFv9et4wfXISxKHBGpGfTjYtpGKshXNl73IEcGFJNcAyNipMTRBX+Djhmw5K9lbZ
	WBfaNvqCZjzHo3PJfGTGjpi2tYQXCLk4xGzARPGSzALMNmrOEeL035/NTjZrRQ==
X-Google-Smtp-Source: AGHT+IEaF56IevDwH1PlJFzgIzn4Rz1u6SE6rS1RLdeE8PwEKVL790XcKH2PSR3s+mYVPQUNRYS3gQ==
X-Received: by 2002:a17:903:3baf:b0:224:18bb:44c2 with SMTP id d9443c01a7336-22fc8b0faeamr60003715ad.6.1746828711068;
        Fri, 09 May 2025 15:11:51 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7b2a004sm22510225ad.106.2025.05.09.15.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 15:11:50 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <rabenda.cn@gmail.com>,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] riscv: dts: sophgo: add more sg2042 isa extension support
Date: Sat, 10 May 2025 06:11:21 +0800
Message-ID: <cover.1746828006.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add xtheadvector & ziccrse for sg2042

Thanks,
Han

Han Gao (2):
  riscv: dts: sophgo: Add xtheadvector to the sg2042 devicetree
  riscv: dts: sophgo: add ziccrse for sg2042

 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 320 ++++++++++++--------
 1 file changed, 192 insertions(+), 128 deletions(-)

-- 
2.47.2

