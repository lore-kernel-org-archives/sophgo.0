Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31EE336EC6
	for <sophgo@lists.linux.dev>; Mon,  6 Apr 2026 23:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775518052; cv=none; b=M/QL0BHBFdDwcfCROILp56HjGZxNGDyjuuJw70hwIxZHuaJw7EKBJYD2+pAPNMxgCfJG8tXwZam62Lcu0m5DtfJQnJE3h/24JxHf3JXZD7RAF0pGY+Xty4OhCumb3mcTfVJ2xFg0PdqkXOh8BP2VdQ+WEXM7ex6LQn5vnX0WLec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775518052; c=relaxed/simple;
	bh=VO2qT0XRHPTohWZq/ejyApwBoPTcajK5dyel0/L0Eps=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cjo7QeVH9tEJ3CwR+MrA5ANQq4wkKYWCB6xoSPeAEfAan7ggFHY2rD95dMYZcIeUlxNloW3O0G9kkVlMFBHBz6ECDw8e7m/KMBFCelz9ns4CF0++Th0TSUyuQU2IRQ6unHsBQmxnCMrN3U3U48lrcJ55bKn8+ViUauxGcS1UVr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h5rj8/PL; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5rj8/PL"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2aae4816912so27867055ad.2
        for <sophgo@lists.linux.dev>; Mon, 06 Apr 2026 16:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775518049; x=1776122849; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=50N06dk5rv5+IwRtcE9Xz5zFkvyVJbkQQF12RzsxXe4=;
        b=h5rj8/PLFWDRcP7BdozGHw1L4Ls9VZM2yeAeu7lSflSw2imadi96mA4x7JQKA/WfmR
         B3upDzQkzHJy56Gv2vgrlvaiMT9LX35t1sY2KSjpATZ/Z02SYcAhKPLoihGvLTZoZHQx
         ysA/aMSwSEXEjiP8BtUKrzj6KWTW6E2w2pFav8f36uugYcn8gebVYMM/v1qLFdLph59E
         sSDVK+PYDSm3kdk86m1en3xXe9szqp7x35bDeGe9BzPc5qMsmKuLZesU4BrINyxXhELE
         o0RKH8yMbie9Zu4OaPxR/Nj8+wIpMGfnwwRcCQZ0y4n1ITMZROC7HP2md5xF/XU8bQpS
         J02w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775518049; x=1776122849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50N06dk5rv5+IwRtcE9Xz5zFkvyVJbkQQF12RzsxXe4=;
        b=m6O9jRtGK/9vHQoMNFzHN5Bw9cjD3MiXK4/RtDA6pGxsSy71daxVI2vUFMUuVX4aKs
         eNgqf+r1uSO1pJBtV8HANnRTVFYGq7funtbjHz6/6YViI4SQgcoRPaSPXbB2Dq2qTye8
         e92q++VERjxuhmbmLumxCHDzL4Q8vqwK26UwPyaOx4tl0DHWyT12HX3nkwrSF2bJR84v
         AhWJkBcaEqVzihhA2BuyKvTgAP8eb1XGpKicvnJBuSa4zk5fotKfeYopYilJ3rY3LKYh
         dJml0esgEwbhtbws77x/iaFpcyYMUF9TVsZ4hdMD4PuzuEJi+vFnAbolqbo2vWsaJw1C
         xfDA==
X-Forwarded-Encrypted: i=1; AJvYcCVhhiQWBS+HEboM4Z53iXYC6AiXSm4Lwglf4uLHiL223/7//LgIO3GfsvV9Jw/Sv5hvKk1YQNY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzr9ER7phgDt9DEboKvHAyku1Qx6q2w3lCDc45KY8cT7sAFR737
	ZRwHkMqf76lI1JwEgqeidJLjX2/TPnXojSj3MEPV3Nu9JeP19aym4U5+
X-Gm-Gg: AeBDiesegBrDtf/nBs/xKPyj3i19USMGsfF/OcciFMz3TwscY7MeP5p0iacqNXqtM+j
	AGm5KGcUBdVPXWAno92XCCI8Q54/v4d4wVRzOmlcRsyy3l+u2nG5koi8+lrBwkg3pb6VqiRpFnR
	GMmZBj/+SwVw8LEwSqnNnwAXfcj/+yD/tBzod+24yxfA9L1RaCoc+rr4W3ij0yhV0CMetW4MykY
	8hBfKn5LIKyh2NomcRv1lYRHXEVHxbbzYx3xIy8S8rU732h1PzjkdkJz8dBKzI81gvNdVJ3g8YS
	jl6DP/S/rwve/+tKFA6mB4o0tgUnRj70ouWykhY85TWqtRomYicLLYjkYP0mKlzs0xkf4TWLYM0
	UqqBqIZU0q3wetm6AFM7rZFBylBwMmtrxP0m0Di5zE9cqSNq96cmOoT7L48jJCwd+lk/z4aJVr3
	lrQcGjM2FcfxkC5p+BSyz8e9E=
X-Received: by 2002:a17:903:1b4b:b0:2b2:5c31:24bf with SMTP id d9443c01a7336-2b28175bf51mr156601865ad.19.1775518049008;
        Mon, 06 Apr 2026 16:27:29 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749a4791sm149536625ad.66.2026.04.06.16.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 16:27:28 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Nutty Liu <liujingqi@lanxincomputing.com>,
	Guodong Xu <guodong@riscstar.com>,
	Guo Ren <guoren@kernel.org>,
	Xiaoguang Xing <xiaoguang.xing@sophgo.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/2] riscv: dts: sophgo: Fix CPU unit address for SG2042/SG2044
Date: Tue,  7 Apr 2026 07:26:53 +0800
Message-ID: <20260406232655.144043-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CPU unit addres for SG2042/SG2044 misused the decimal number for the
unit address, Refer to this discussion in the Link, it should be in the
hex format.

Link: https://lore.kernel.org/devicetree-spec/00ddad5a-02f5-474e-af9c-11ce7716ddfc@iscas.ac.cn/

Inochi Amaoto (2):
  riscv: dts: sophgo: sg2044: use hex for CPU unit address
  riscv: dts: sophgo: sg2042: use hex for CPU unit address

 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 236 ++++++++++----------
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 236 ++++++++++----------
 2 files changed, 236 insertions(+), 236 deletions(-)

--
2.53.0

