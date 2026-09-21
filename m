Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F744AF9C5
	for <sophgo@lists.linux.dev>; Mon, 21 Sep 2026 15:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790003360; cv=none; b=BqR1O7FiND/uBwYyq+wErpgKyvyK7Jba2Swm0xozcS7BzXFAk4mch49+vQyzH/bIzv6HqqcCkNBqqtmpOahPKcIIvPqwmP1J4kskMfn7wCrEemaO1CuE81GQBiOM7ZpkAnQJ4O/pkFIw9ha5SmY2DQQF40gJNtOCesDgNYmubKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790003360; c=relaxed/simple;
	bh=hf5kjbI81u8GhWKWua09PR9zzZ8Qo0DwQU4NZxqtTl0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pVXggl0MAakegKhKrRMjEz3RUEd5iyfJn4W4sG3lDVxmX1tbkeRybkzdvhi4p3VLPDkfkWxNmhHCP3mYfH6q5dl+U24oIArvL+ntWAWkYfvwCb7Vw9rB4Fp1/BwPEvbgiaflg1Os2QvRMIvxZtSfoz9v8Egymg/pr3np0WyivHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bxgJBIOY; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bxgJBIOY"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso22252695e9.3
        for <sophgo@lists.linux.dev>; Mon, 21 Sep 2026 08:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790003357; x=1790608157; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6nZuDnIdpGvlJrJpl4QPHUuS58+C3sDRO9ZRmoer2zg=;
        b=bxgJBIOYmXBrWykJdbU5Rn3tPYeCoeutLbryMjgenYIW9vkxNbSDs+NsE3KINS5l0+
         7qnwoqFSN5iWu+n1Zn/pr8sB6gbU0uLu9+mNEl2LLx/AANzDx4S8vw8dp2yvlCHsI/Ry
         0Y+bteLmflsTnrpceQSSiQHgj8uvnHuDTjdSNfEqEF/INwVcz2JNCIJXX3/U54fYfPk3
         biyPEBELCo+G8wsarzJhUVxOzyeOXdeDJBKv3ZBtiVfjnatNY3VqWcD3/azjaYV5odBX
         2plG+hqucxuJ41VR79KKUoG2NHzepueZeZO33lXVMALnyHz98l706bO2wRNRzOzb+jMh
         LHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790003357; x=1790608157;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6nZuDnIdpGvlJrJpl4QPHUuS58+C3sDRO9ZRmoer2zg=;
        b=tLN0EuTysocBCUDZinBBYT7zdqZHjBYUMMe7wR6EU13nmPqP5XAFm9DhkbD0KLmS8s
         ZV4+pegk55+zOChd9Bsms6Y/wrLHu6KY2ZGw+jUm4++I00MvIIU6MdpNKuEbAwsKy4x1
         hM86FYjjup71m+jg1gvQ4RDrC68+HHOhOxUaldUN15hL+qpX98e/B0hRii7I+ZLsOnA5
         H2+eGn8lpYNyqcaCfeI39FAmt3eqvMH/2dsHqUgpIIoXPWo6CeeYv6E6CXxdDuo3VtrM
         ILNcklinU0QeXt1jn48cWqWZSS/f9sx7JMgPpJ8WHY0yD+7XwDf3bFCqGZCSHa6I+HxZ
         /26Q==
X-Forwarded-Encrypted: i=1; AKwUvBxW6XZ2fTYSb5mJQmbJWheMy2CAPa6+CeS9MYoSuLJ0Aho2TFu/F12Azk7APe4Y2V8dEnW0vSI=@lists.linux.dev
X-Gm-Message-State: AFuF++lZo3gC7Svsb2bO+RwvG5ytxs+LDiUtlJWRE+IqGlVRlNLQaGA/
	sfUSR1/Er9Nbyq9D/GlUgVa6TF2NULs2OxCti0UVLeLO+V+bh30Rr9Ln
X-Gm-Gg: AYBFou2FOW48m8BwkePLjxAMd4lb7/4vfx0iwxhmCaK5G7d52snpZ6vvcuiD0GoeUkY
	7KzR5RmXqE+bDS/TiQk6wzklY6b3h8Or7kdPdZNycRJimzo+4qXZYM4NAkpFM7Od+JRndS88/PE
	n8+GbQM+3W5PubXvImHmTbTXxZfLTw7tAbCM3c5vwCjxxwuwEakBzUgSK3Nr4Qq7JuOkkFLrw0b
	jRl/bbSQC7nrnL/Nuqhai2lGD1qSnMLIsDJORni0QrhdwzJfjsXh7p2X6xzizRh+mhNjhEdsDK9
	gDvZeZ+YULFbtGWobtGlHOPuL98MIGluyZhMw4IpkScC+tM5RiXIQddFdtSlZovMZ5URbmQvAVE
	orEp/NiFivwLc0OTlu/x3yrQRLddPFUTeoEMoliou1hr+ZXBmMsLayLr34PuYAFfrW3jEqd8nzS
	5RkaUNjdq1uTJ+U+011g2Uyt+QGg7tXjY/FpqBeqmmgwsI+o5Hw5gzMsWYMOLQ4kongUgpXHBsm
	y7SNJXiSHGjwKw2G2mq+W6vjJNmHTyRsRklVX/5NfYKN8yg8I11lD15bCQv18xq+pBs2Yeodb7N
	OYDfvOw/UbYOpRryFA==
X-Received: by 2002:a05:600c:4691:b0:49f:bd3c:bc1b with SMTP id 5b1f17b1804b1-49fc572f297mr139363745e9.22.1790003356583;
        Mon, 21 Sep 2026 08:09:16 -0700 (PDT)
Received: from [192.168.0.233] (2a02-8388-e6ca-5780-e161-768d-5c97-84d0.cable.dynamic.v6.surfer.at. [2a02:8388:e6ca:5780:e161:768d:5c97:84d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc56eff84sm255659435e9.1.2026.09.21.08.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:09:16 -0700 (PDT)
From: Andrei Lalaev <andrey.lalaev@gmail.com>
Subject: [PATCH 0/2] Do not reserve memory for coprocessor FW
Date: Mon, 21 Sep 2026 17:08:58 +0200
Message-Id: <20260921-sophgo-remove-coprocessor-node-v1-0-ace29446b327@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ6CMBBG4auQWTsJNEDEqxgX0P5CTew0M0pIC
 He36vLbvLeTQSOMLtVOijValFTQnCryy5hmcAzF5GrX14Nr2CQvs7DiKSvYS1bxMBPlJAHcovf
 dME7dOTgqkay4x+03uN7+tvf0gH99q3QcHwa5uTWCAAAA
X-Change-ID: 20260921-sophgo-remove-coprocessor-node-4e6c59ab58d2
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Andrei Lalaev <andrey.lalaev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790003355; l=1759;
 i=andrey.lalaev@gmail.com; s=20260901; h=from:subject:message-id;
 bh=hf5kjbI81u8GhWKWua09PR9zzZ8Qo0DwQU4NZxqtTl0=;
 b=GWyRcQp1oB8Sh4EZuyzCScn2OIWBgOKi080vPgH/ZvEmbEh78yfsQHts+sQRZUH9qqncxyCcU
 SRwo1HzBuu3AZg9vJqEr7ZCrzi3yECFcHcvQk3vfnM+Il1FVWF7qKSA
X-Developer-Key: i=andrey.lalaev@gmail.com; a=ed25519;
 pk=YHk+K3q98GV/1CigmrEAQ+Vc0o+GlFWt3j94jvrEh6o=

Milk-V Duo and Duo-256M reserve a region for coprocessor FW at
the end of RAM. It is not correct because:
  - FSBL can be configured to load FW into a different region
  - if no firmware is loaded, the reserved memory is wasted

As explained in [1, 2], FSBL should reserve the region at runtime.

The latest FSBL can boot the system without coprocessor FW:
  FSBL Jb2829:g6f8962c394dd-dirty:2026-09-20T13:04:17+00:00
  st_on_reason=d0000
  st_off_reason=0
  P2S/0x1000/0xc00fa00.
  SD/0xaa00/0x1000/0x1000/0.P2E.
  cv181x DDR init.
  ddr_param[0]=0x0.
  pkg_type=5
  D1_3_2
  DDR3-2G-QFN
  Data rate=1866.
  DDR BIST PASS
  PLLS.
  PLLE.
  C2S/0x0/0x0/0x0.
  No C906L image.
  MS/0xba00/0x80000000/0x43e00.
  SD/0xba00/0x43e00/0x43e00/0.ME.
  L2/0x4f800.
  SD/0x4f800/0x200/0x200/0.L2/0x33334c42/0xcafe4b49/0x80200000/0x8c200/0x8c200
  SD/0x4f800/0x8c200/0x8c200/0.sys_switch_all_to_pll...
  Loader_2nd loaded.
  Use internal 32k

So it is safe to remove `coprocessor_rtos` nodes.

[1]: https://lore.kernel.org/sophgo/6e4b5c98-7d48-4629-a6a0-4d930327f9a0@sifive.com/
[2]: https://lore.kernel.org/sophgo/aqrhRic7Ww6fPhxg@pie/

Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
---
Andrei Lalaev (2):
      riscv: dts: sophgo: cv1800b-milkv-duo: drop reserved memory node
      riscv: dts: sophgo: sg2002-milkv-duo256m: drop reserved memory node

 arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts    | 11 -----------
 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts | 11 -----------
 2 files changed, 22 deletions(-)
---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260921-sophgo-remove-coprocessor-node-4e6c59ab58d2

Best regards,
--  
Andrei Lalaev <andrey.lalaev@gmail.com>

