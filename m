Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3420B1552FD
	for <sophgo@lists.linux.dev>; Sun, 26 Apr 2026 01:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777167296; cv=none; b=FmSRIONzNDx6QVvRCl6uhLp1uIERoPZ4PbJp1D//UJoOua1OAO9FhRdfWMUcay5eGNBiYLYyzqT6NX3G11AxLP3Ky+egrH55kF8obPTwWytx3lr5dcNKpEIF03bNnNds7BruIw86fKUAeTffA3wBqSyE/I1fi5IPLROmfy9YuuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777167296; c=relaxed/simple;
	bh=IA76OGHFsqwD4RUuyHqjzkcTT5i5P/QAtOqGmM0yeMU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ly5ETLANXeHr/GbcqxRe8MfuQYaYLlaEKsmbCpr4k66wilqvUCpGqPj7Fkhks9DzU5qMA5qI6Gxg4Dyp/KBaWUXR2G7FeeYqbeFlM9NLYtwsJdzFxugjDCPQv3oW0EL1LUcZXf7rtejdgiXHfSKLVlQisLGfiTyEACEJrFzkHQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aAVKxmLK; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aAVKxmLK"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82f8893bff3so4268219b3a.2
        for <sophgo@lists.linux.dev>; Sat, 25 Apr 2026 18:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777167294; x=1777772094; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SQlX97El9hfOHAc6J0vlS+XAoLtlpdMNeOx9avsuntw=;
        b=aAVKxmLKAD4BWnGAaQuHQ7rMhL3MnmS03xyHz8srvQBfVw5k5iWxhYn81N3pBvf2ZP
         zt+pUzJyy6eE9Jw0Q82R5SV2qA6t6pBA2wu5TSjT6n8M4Cj4baTyLidg65GNRc7A+gg1
         l7GlST/oCHRziYwnFHUTm7oBtPg6Ma2+LDluL5FJN/9ZLVft2xHHX9lPB0dwCMmJ9Z92
         wd/ldYJQay6Wy3hFZlWv4j8qb0Es26mai9NnNciU/Ku1I0EgyEWu/cZzeFslLlR1Ifbu
         ajTkgP/W2juGGiE1HxFgSiDwDjOG/OmMA4FR+sSxAY1HQUMS77AFCdy87N8wTtGWRAnt
         exQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777167294; x=1777772094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQlX97El9hfOHAc6J0vlS+XAoLtlpdMNeOx9avsuntw=;
        b=rIOv2HIFnivXzUgp7g9NlEKQgavp2SdaDAsRAKRmyBcp7zURwNz0f+kEkSmFjRFaQs
         rKfOkZUCY3yUHBo/pmhcHQLnZirvKVFaxHBxTkjXLXm5anQnqmceEmd1y5l4qXSrPSKB
         AMhzJ+GoNMBGXXd4fJ8VSA3rmP8fVyXhjwWAxxDBBf8iw1Xw98GZmBwixkzp9lM/m9gn
         c6iPHpnKnqx4SV76krYIQFs1ysee6fHEXkdPVzmdxFNzmoHmWb506ifr52IrdrVxTw/A
         zB78iedBc/Ca34H35DU66ouFDwDDOiy/NV83Lwjm3k5TAivFyNKTvZ2JI78ynWX43FsD
         NGOA==
X-Forwarded-Encrypted: i=1; AFNElJ8LX0Y1aNkpGUj5/sjHcuLwAebwknWTb+9QDKc8OovL3yaHg5hmZZDbbIvpt/HV2+T9+6Jr9aM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxc7ftYY6jpJKqI48BOEX7+1QiTStliOpYgWqlX4bDc5hZ2BRwV
	u6KVW7fa1XmSpFv1OG4fZhkuNEHi4hXkZ7Sa2I8AKS2KDdusVIB1ZDMM
X-Gm-Gg: AeBDieux4JaygDprdjWI3pnBMSqNq3oMwa5+WCtZuU8wzGdOYh/lgpRHAsAqHf3kEHi
	3m1TQpEUh7f1+RYoDQ+DMbglJpP5RMFxxDDK/LnuKhwkE101fkhGn+o3wDNiZDzCR+fK24idrgj
	JadXRS6ir16lwkHjZd6FOMfeCCrrFlcJcmTtTKfDO0MvkWsmQHdQMG4WkQC3yuwL3Ff/3ESqmCs
	CfC9ADabo3bCnSLO0hxgghw6Xm/H/7XJTrmGzTWhj3q8VRhugpsLIrYSo8p7qFa91iCz+BzvxuF
	us1VfLAwfpgzTYSwG7x89HRJKgpXsBgTdtmWkUFlnO2WIei1zD/Pe/x7DBn5Rz+fMoMgL1c2SNL
	AeNyIQA8XdBYaI1XUVHeZH+avEzp2UIVUK2jc20MfhQPfxsLdUrm/z59QJ7nnJUshRgS4Hgdzbt
	oOIB3gMk5xClXshHxAATqLTWKJGFytnRD9Ng==
X-Received: by 2002:a05:6a00:3693:b0:82f:4191:da10 with SMTP id d2e1a72fcca58-82f8c84d72bmr34897489b3a.6.1777167294286;
        Sat, 25 Apr 2026 18:34:54 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec06cbfsm32046385b3a.58.2026.04.25.18.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 18:34:53 -0700 (PDT)
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
	Chao Wei <chao.wei@sophgo.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 0/2] riscv: dts: sophgo: Fix CPU unit address for SG2042/SG2044
Date: Sun, 26 Apr 2026 09:34:47 +0800
Message-ID: <20260426013449.694435-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
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

Change from v1:
- https://lore.kernel.org/all/20260406232655.144043-1-inochiama@gmail.com
1. Apply Guo, Conor and Chen's tags.
2. Remove Link tag for all patches.
3. Fix comment for clarification about node name change for all patches.

Inochi Amaoto (2):
  riscv: dts: sophgo: sg2044: use hex for CPU unit address
  riscv: dts: sophgo: sg2042: use hex for CPU unit address

 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 236 ++++++++++----------
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 236 ++++++++++----------
 2 files changed, 236 insertions(+), 236 deletions(-)

--
2.54.0

