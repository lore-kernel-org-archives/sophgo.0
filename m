Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EED26B746
	for <sophgo@lists.linux.dev>; Sat,  5 Jul 2025 07:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751701223; cv=none; b=OM5PGdHxj4kmZ5SvWDwMCZk31f1mUqiRw0C94im5CsPktyD8uPMefXxRESGjjaeF2BZ1G8nLQtejlzJyyIE/CVj9q2F7c1AI6doXiuQUH92KjN4+9S7nBp73ZUurhGR/c9vFbSaLju/soCtW0Lm4N8NMHO7oUZrABPeH6hPGPdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751701223; c=relaxed/simple;
	bh=R+iSI6sdCJdeUl0gxats286kau8f7kIZFSY9tvlWBos=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CYcAtnkeOgowduEmujhhJutlVI6RBQJowkizRY8GDNnYlSmI6qJS5JPL7NM5xiCHN4W5W6FlZJheYjl/FaxvwzWCwTCuyuCdH31do82wEw/uGswUyktMc8wXUGziHUToI5vSEPYaer8/IdzR+/iw0Tu0h4UKR9i/b1RF9xXrryw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2L6oeD2; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2L6oeD2"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-73972a54919so1382056b3a.3
        for <sophgo@lists.linux.dev>; Sat, 05 Jul 2025 00:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751701221; x=1752306021; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9pNVq0NFhmMGqq43JjiIlScR9xl4RowLJ7sMjICAIOQ=;
        b=a2L6oeD2Bx4Ln38RY/oTmr9KqONhvHA58TdbF+WKwgWTw4nFXvRa073fe7EvIyRChM
         BjWF9riQgl5q6BdNK5OFd3OH4V2n+8S/9B9hxuy50Dm0cFErHh3Y3CZvEgfSL3kWBi3U
         DRfAYldTwEu3l+7TVbgFxG5Adu1wsJ0SCF1g94ojtu63cuejMVbsJmL1vaBfVubx52cK
         7WadzN/hSTle3XoZIYrmZj+sk3dZTf126MgVYN4epTFOWr+81dJq6QsB+kwV6XZaNMWW
         xuGhOcXPbk4WIToTN2rZ+VZYYdp+yxUolQH+o2e+KXcJeLJQRxclh7eZGBvEJeTcaIsu
         uufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751701221; x=1752306021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9pNVq0NFhmMGqq43JjiIlScR9xl4RowLJ7sMjICAIOQ=;
        b=FetuvCbmHmrpjckabc+q02JH5/iOWhZdi4qiLvDA/xoOuC/UbNbp9bxP8ob1W7YT6r
         CQA90AsTZ+zHTh/vZJrK2mSuE/9Rq/9liqKTIjIUc+GGLPrz/SemzNNIMXe3n98bhKLT
         rOSHRm1kw16QJpLpeaGQAAJp20Q33rbPdXMtSzLKqHPDpB3sY6t+mn1ts6FPXAyLM021
         xi175mOuPBn9gEAzosb4gMy+oltojVohm7ichIvwQK6OyFY6A086W/zwSy8+rptwDbGf
         /gTPkA4F0OaPTb5zYNkmzZsZ/tAvsljd908ZEFI62xprk47+Pc6i6EY1x9mqORnnWzs/
         JENg==
X-Forwarded-Encrypted: i=1; AJvYcCWJUIkkqXFsayngQRqV8DJxAfESADyfJvHpfSPszs7/seGFHx40/+Vj9QvrpP3dZvbIexrbuwU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyAhCCcogNUOHjq42frPLkMjkQ4BfY4++cxa5xfmg5qxSyuyIJD
	OuXwfNKcvAs5aoPMKZZbfW4v4k1wQvEyKpw9Q5+K9HPidtqx77CuKqJ8
X-Gm-Gg: ASbGncsN2/RGHXeBT0NjZRFGdYe0pi5G+MKPiLbhfFjzYSo2EauYMaXEfKdsw9exywM
	O6Y2hk87C9yCFa3HzeZ9ZwOa3ssSVFnCK/jct3NKdRt8UJd1KeUuE5g5j2o607g9gxzm36g2r0I
	Dw/V8LRFnndLrBns3AA/KVYrjHhv3XKZAtu/uf4bSQ1ITN5tSY22S50zPMpkIzocnYLGnzwdqdt
	lynQ4QofyDcI8VcM2MVn/ko+PRZX+EHTGUFgJTVu033vmB+HTQkygV6qiYjf5goIVjdT3uF4KgV
	hGcLXxYtuHXpQ9oqYAKU5yGmzSSyxhKHjWj9kwbXy24lzn5MtC9pHBG9BVSrdvUqWDhYJyBVwS7
	kmffS7sQ=
X-Google-Smtp-Source: AGHT+IEHsZMB8Rt3ySNMA98IFcpj7ykAyWeeEOZtesKG64iloxS1vXwaT1pyycU737qfyAG5dcZ0mg==
X-Received: by 2002:aa7:8893:0:b0:736:3979:369e with SMTP id d2e1a72fcca58-74ce8841fc1mr5530451b3a.9.1751701220593;
        Sat, 05 Jul 2025 00:40:20 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417e852sm3993616b3a.85.2025.07.05.00.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 00:40:20 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] Add Sophgo EVB V1/V2 Board support
Date: Sat,  5 Jul 2025 15:39:53 +0800
Message-ID: <cover.1751700954.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sophgo EVB V1/V2 [1][2] is a prototype board based on SOPHON SG2042 [3].
There are many of these two boards in the hands of developers.

Currently supports serial port, sdcard/emmc, pwm, fan speed control.

Added ethernet support based on [4].

Changed from v2:
merge v1/v2 binding
v2: https://lore.kernel.org/linux-riscv/cover.1747231254.git.rabenda.cn@gmail.com/

Changed from v1:
1. replace "sophgo,sg2042-x8/4-evb" with "sophgo,sg2042-evb-v1/2".
2. replace "Sophgo SG2042 X8/X4 EVB" with "Sophgo SG2042 EVB V1.X/V2.0".
v1: https://lore.kernel.org/linux-riscv/cover.1746811744.git.rabenda.cn@gmail.com/

Thanks,
Han

[1]: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x8-EVB
[2]: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x4-EVB
[3]: https://en.sophgo.com/product/introduce/sg2042.html
[4]: https://lore.kernel.org/all/20250506093256.1107770-5-inochiama@gmail.com/

Han Gao (3):
  dt-bindings: riscv: add Sophgo SG2042_EVB_V1.X/V2.0 bindings
  riscv: dts: sophgo: add Sophgo SG2042_EVB_V1.X board device tree
  riscv: dts: sophgo: add Sophgo SG2042_EVB_V2.0 board device tree

 .../devicetree/bindings/riscv/sophgo.yaml     |   2 +
 arch/riscv/boot/dts/sophgo/Makefile           |   2 +
 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts  | 245 ++++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts  | 233 +++++++++++++++++
 4 files changed, 482 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts


base-commit: d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af
prerequisite-patch-id: 7a82e319b011e5d0486a6ef4216d931d671c9f53
prerequisite-patch-id: 5a30fb99ec483c1f5a8dca97df862c3a042c9027
prerequisite-patch-id: e0da79790a934916d9fc39c18e8e98c9596d27ab
prerequisite-patch-id: 84d1e1637549f632729eaeb7cf935ca78a642fe3
-- 
2.47.2

