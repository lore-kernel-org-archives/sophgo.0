Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA77430E82B
	for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 23:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768432752; cv=none; b=BPqjLYfPTnpKlfLNTXa7lEYagcuNvNWVdazJBfsJpqPxyw69biqFCgmBMg66HVMoVxdCJcOCfLKM/rlepXdrPyMaDDDCitv/iz9sZe2T0v4RMORYJU6fC8idk2JR2uxe7jlnpuq7KFnfGwxrDjNhm28A3sPmvc7rMS/B/00s/bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768432752; c=relaxed/simple;
	bh=dMRDUj67juJ+/SsYMp+tHnUQdNzJNprfUWQkHUrBcs0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VRDWLYzGdtwHozWylbhh1538mr25XBGqoByMlX86Wa0d3JTqOUR1FUxHXL+mZ4zBquDMoFFXK4imule1amvDP8dQdIFKW9Xi0p6gMEg3Xwr/UcoAWJ/eiATn2EYPgR0tLWeUPb15zqNFT2JE+R0ywSSna3K55RfwrSBnj2+bfXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=DmZZbBeI; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="DmZZbBeI"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a0c20ee83dso2152335ad.2
        for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 15:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768432750; x=1769037550; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vDXoKIsP9kVNdS0qAjm217ovsIR/3ucrGnmc72Ajwto=;
        b=DmZZbBeIEdx/UdhE+NU5EyGK1d/8ZMT3L0dvdeAJpuDAHWC8C/MnX4PlzPiqbOtGfN
         JdUIduwFqFX9U8F5m6l+CgLLaSg8vW+yA4oLWqBgxqfP7lHjkQRkry2Yz/btvcKm6S1w
         BHsK0qFwBuDuUS8MqGMI9u1Af4nwt4zc2ns15BsrtZkVBYQzRif7MR8OIk41xSvONd4A
         UwXTQnNcVh8RNf1s0NFnc3tQtHjczbInFdX0lWDbuYZaNRATcgnIpud2NGDnN0gyTopC
         eOGCpjP8k8ynKKCMef1ImLvZxGS2FAn4iNg/zo5BEc7Md15Ej3pILoS90Bz6b2MgjVV8
         ou7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768432750; x=1769037550;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDXoKIsP9kVNdS0qAjm217ovsIR/3ucrGnmc72Ajwto=;
        b=OUBWay/D1Ef/fxcoMfWsmXe/mbzwFMAx9xiNS2uVLJ1Ak92ugqP5x8+Hs4IijIrm//
         bjSG4twyN7PYyhmmC80fMzlankdgi6xPcYiLEirlpV7k7uZpmD2v//dEP0JIglSr5+U1
         iHPjdsv2i8qNJpVItFUxjFb5MeeStGtg7rxyv62cZe7fbi18tC9YvyWR/vLejr2MOcUD
         HevjmWucaQcr7ErspDDMvCx7dE4qbIcXGA8jlF/GJM3yA0/nCjBx6IfZupuT7HqotWDI
         MqMytI1SnUJQXwRcZJ8cI1Zc28vn2B0l40vmFTuOdrBX7LXjo9Q3cD1oRwt25TNLgtvI
         cjww==
X-Forwarded-Encrypted: i=1; AJvYcCWK2YVVpgxIzxOCBK4onw0NkLe5ffMaR2KkH+8WnUYZhPp9z3DFgzIQg84C5LRPf3wCaKfIldg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxiX5cbrHFcNQsF2E7u6x3mJJE7w3PB8fg7py+AXkyCk6vsEISd
	F4N6Ig/mcxGbfBkE3/+s0a4lCn/nV310g3a+N3gPK91wd/0tXv9JTQJK7ZuOpGijDak=
X-Gm-Gg: AY/fxX74EFaWPfH+7bnrHQGTqtsbK+BD35gMUO25Jar/ETU2TSaRDOoCloyIuisE/Vl
	1MXKm/km4z6gqOgjuSbVip5h6KQkBBX0Tv4/BomegncFqoZPAORxV0HIYBi2F7i/bf3D4jDnIoc
	DPFmiamc+KNSBxjrgXBHCwqQEjEBM+OPI1OexT3FkyXFTTe0+l1DZ1TwhhSET8JhXNrC5Wlyl0G
	ilyhpwAfnOfOam9V07zJZW5MURRnetCSn4FQsxTgZwBg45CrXKrU4ya4AHxOAJd1MW6P52JsD3l
	miY58DKsYDEjeq3xz7oWNXEdsmgTonJDTwQfXaLafgOG0jx5N5PdSsNuhM1SKLYthJH/a2H+/Oo
	zEW5n4DwcPG08ECFxHpJKg3HOp9gfybqoNd0oI7mScoX3gsXDsxSgR5kQCgidylZRrvTNI1Ix/q
	4yn7MrtV6z+wNkyTiviLJawlaifaSopsvCyiDvUvbLqXjSJNrf3jh0nA==
X-Received: by 2002:a17:903:230d:b0:2a0:de4f:ca7 with SMTP id d9443c01a7336-2a59bb17305mr35287005ad.1.1768432750017;
        Wed, 14 Jan 2026 15:19:10 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2d6csm238591755ad.64.2026.01.14.15.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 15:19:09 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v2 0/4] riscv: dts: Add "b" ISA extension to existing
 devicetrees
Date: Thu, 15 Jan 2026 07:18:56 +0800
Message-Id: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGAkaGkC/3WPTW/CMAxA/0rl8zzlo4W1Qoj/gTiExgFragtxq
 IpQ//tCu8sOOz4rfs95gVBkEmiKF0QaWXjoM5iPAtqr6y+E7DODUWajtLbovOf+gmf0SRh1+bX
 VZWVtUFvIO7dIgafFdzytHOn+yNq0DqEjEbdom2L3a1X4bfHshNtsxbFEhb6sTbDOqhDcIbK0k
 lz8bIdu/87kt4QZOk5N0dOUcDWpGt7VK0sa4nP51KiX7D/3jzq3jPEbqiqvax/+tOA0z/MPi9k
 PniMBAAA=
X-Change-ID: 20260113-adding-b-dtsi-148714533f07
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Yixun Lan <dlan@gentoo.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, linux-doc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3

The RISC-V "b" (Bit-manipulation) extension was ratified in April 2024,
much later than its component extensions zba/zbb/zbs (June 2021). Recent
updates to the device tree bindings [2] enforce that when all three
component extensions are present, "b" must also be specified. Related
discussion can also be found in [1].

Patch 1 clarifies the ISA spec version for canonical ordering in uabi.rst.
It is a trivial update, but can help readers reference the correct
document version. Acked-by Paul Walmsley in v1.

Patch 2, 3 and 4 adds "b" after "c" in 3 different device tree files
respectivly, anlogic, sophgo and spacemit, fixing the related dtbs_check
warnings.

This patchset is based on top of linux-next, tag: next-20260109, and
depends on [2].

Link: https://lore.kernel.org/all/20251230-imprison-sleet-6b5a1e26d34b@spud/ [1]
Link: https://lore.kernel.org/all/20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com/ [2]

Changes in v2:
- Patch 1: Add Acked-by from Paul Walmsley.
- Patch 2/3/4: These are splits from the v1 Patch 2. Split into three
    different patches for each SoC.
- Link to v1: https://lore.kernel.org/r/20260113-adding-b-dtsi-v1-0-22d6e55d19df@riscstar.com

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
Guodong Xu (4):
      Documentation: riscv: uabi: Clarify ISA spec version for canonical order
      riscv: dts: anlogic: dr1v90: Add "b" ISA extension
      riscv: dts: sophgo: sg2044: Add "b" ISA extension
      riscv: dts: spacemit: k1: Add "b" ISA extension

 Documentation/arch/riscv/uabi.rst           |   4 +-
 arch/riscv/boot/dts/anlogic/dr1v90.dtsi     |   5 +-
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 256 ++++++++++++++--------------
 arch/riscv/boot/dts/spacemit/k1.dtsi        |  32 ++--
 4 files changed, 150 insertions(+), 147 deletions(-)
---
base-commit: 31d167f54de93f14fa8e4bc6cbc4adaf7019fd94
change-id: 20260113-adding-b-dtsi-148714533f07
prerequisite-message-id: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
prerequisite-patch-id: 0c859b4d131b3360875c795c6148c6176b55fb91
prerequisite-patch-id: 2ed98dc1ab0f5ed923cc252415c345dc8caf6f17
prerequisite-patch-id: 1be1a031763fac029076a768f012af31e455be66
prerequisite-patch-id: 21bb8387c946e050910440e7a7622305d46d946d
prerequisite-patch-id: f3bdc2c74b230663710086bd770a755d56cb8b9c
prerequisite-patch-id: 1f162c02f8bdb5bbc8ce52ead4fcb76258f5c2b9
prerequisite-patch-id: 76e1ff26c2f1fe4019cfa574942b568000e6ca1f
prerequisite-patch-id: 77ddc9e5dc85495adc803cdc605bdda2ddc7fa47
prerequisite-patch-id: a75c798383b46a14d40436357c769c3671184768
prerequisite-patch-id: 781fc10dcae2c38c84c25bee887ef7474786dd36
prerequisite-patch-id: 5be5d3e62aa73024bf9e1de6aad155be6d618f40

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>

