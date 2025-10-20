Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E388B72602
	for <sophgo@lists.linux.dev>; Mon, 20 Oct 2025 03:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760931187; cv=none; b=cxcykLMFNPhbox8vNVQBTkj2+t+t0qXDp1kJLfxcY0vPou1SncBtDvnIRBKStyBVBR9ISVAIt3DAGmMtIToy42XZcei0ZfAgzcFHe/6ujHL36oAAGXCmkYvx1TUPaa1XfBEgDDAbzES7T3BZyBoSXkKerGtgSH14ks2qyADhHm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760931187; c=relaxed/simple;
	bh=21dD031tGAH9diIPRFJcMBeyJ5+2PaqTPis2r+LU094=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=CBvZAk4Nia6+jKRqknvx1kph5wY4zyNLM+G6/3xrTxS+M41PPjUtyfIkgW3iYbWKI2Y9mDZu7zRjmJ4VBPBJ2d43Xr7aRrtoxiTCKTKDm8iVuXPnDWdFY974mAaCzgdQbalP4VpbfIBM66E8hmfLqIRAuNHOYCKFVMN8ZPlsNrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QR9EheMH; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QR9EheMH"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7bb79ad6857so2126934a34.0
        for <sophgo@lists.linux.dev>; Sun, 19 Oct 2025 20:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760931185; x=1761535985; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TM+5sZf5OooBDgSucBoXLeOFjPqmBCLK+QVbvsF8E6w=;
        b=QR9EheMHLWVq/XHLQYN1hztpqkB/i+X0PA0h4iptbCxkhs50R1YUNYZTWwH7gC3EKf
         bYRlh59bGG+ZWzPlGXyLHzGNN6q2+/MsGFVxIkdAj81Mh4ZxIll3ac9bwfx7bDcMBKvJ
         fJCehAPsX4UJuF2X3ztJia6s0g3mUfmW4lFES/7Tp4AXq3NT3hbvgWsof3pRKm+QpoBI
         FrgkoP15o2cX2aQopzuER1tvdDcLAINXG8LCFu1NTklwX0FkWZwUvJoJN708YUkoOGaM
         z1LcaNsLPGgqrTZGXBqBU3VtdMDRJUCNMuW9yXfo0mcN4NJNiOPy72pLK2VcE5A6M7Zs
         XiIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760931185; x=1761535985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TM+5sZf5OooBDgSucBoXLeOFjPqmBCLK+QVbvsF8E6w=;
        b=MRohQSxKdeYmYVa5r4oOd+VKUzkAoPYLmYmBTuUO5y2qYqKOLzPHvrRfuW5TGQlUbk
         IAvqdnzz1+rgQ4eFSMQwkxPs2sjrL9ReR4ceNeKL1qdIuVhbX7+dzm8/3ksOtYle/AHU
         RqU+cxcQ1BL5j80WXZ7EqsMRbNcrz/nPy+L4SESpDKVH/0OsKKTMW5sZ/KcfJSN7IBqG
         sGPJ0+jFyMehjiNDOTqP2WABrOUkN+HROOm3fLs+6j98l9XdsLBX82uosgBMwFe0ZQxm
         85prLkHZ84a1QxOtnbgwzEkiGhf6FCbUeKi3p6DwVfDYZJts+yOm9gaBxRuXBM5gwaG6
         COng==
X-Forwarded-Encrypted: i=1; AJvYcCU0IqiuFSgdkIM35GWm8Fyq3Oxp7ThffJCjbd6pY+Jk9c/+sVwhFjpen82gZ92M9MCaHKGE1Os=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywgl+XM7iawU5D4QZYcQB069s8aUmzHMD7ybH28Xb1o3FXWoNKh
	844+v709weXhP5B1DOODI2Go1ZrR6T1uRIPtEriAtcsSUuiOAat96YhQ
X-Gm-Gg: ASbGncsoUZOKXzmcKmv5Y2FDXkXZh4zP9GUC4XjHiKD2ionPvcCHjjKa0HmPONpsCga
	o1hEIs+GkeLbrBquoZFNTHr/zxQTXKNsTpL0P1dfw9wegb5veLf4RUMw//Yk8rDDObLqFRn+xYA
	qOJ/4v4ealIfZ+8FC+MGUNLYdztTXl9HbwC/fuzo+JC6iEeiqPXvRmBJBFwJRQSP4ifMK1F/02R
	+XnHeUxhVKPQ3unLpbPXu152GwULQg8lYf5eBNQcIrq801IloQj0IOLdVRTAMlsykW3zNeji8s/
	13DqOGo5xTCHguFnE1yawJyvtz9MHdbSEiFE3DhAYKvX0FOmZASIKGIESL2nnWZBJ773C31t1Fg
	nluXOsPH12E5gyMoHqy+2mI/sZFFQzjJWdUypBqLno0E4fW9KW9wifw9LCS1mlrb1qxXmE0kiP4
	bGyt3hTnPcjw==
X-Google-Smtp-Source: AGHT+IHSXRKU0H/Tj60xds+NdCJx8dzbIdYpjnBVmyNb0yUakAI7tZidFBFo9vJrXoitO39gS81lLQ==
X-Received: by 2002:a05:6830:3895:b0:7c2:7b5e:8cb2 with SMTP id 46e09a7af769-7c27cc4be1emr4547628a34.30.1760931184891;
        Sun, 19 Oct 2025 20:33:04 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c28890e24bsm2244146a34.23.2025.10.19.20.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 20:33:04 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	rabenda.cn@gmail.com,
	inochiama@gmail.com,
	krzk+dt@kernel.org,
	mani@kernel.org,
	liujingqi@lanxincomputing.com,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	tglx@linutronix.de,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Subject: [PATCH 0/4] Add PCIe support in DTS for Sophgo SG2042 SoC
Date: Mon, 20 Oct 2025 11:32:55 +0800
Message-Id: <cover.1760929111.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Wang <unicorn_wang@outlook.com>

This new patch set is a continuation of the previous patchset
"[PATCH v3 0/7] Add PCIe support to Sophgo SG2042 SoC" [1].

The drivers and bindings have already been merged into the kernel
mainline, and this patchset will focus on submitting the remaining
DTS changes into the mainline.

This patchset is based on v6.18-rc1 and the only changes since v3
is a fix to address the comments from Manivannan Sadhasivam to make
sure PCI address of the I/O port to start from 0.

Link: https://lore.kernel.org/linux-riscv/cover.1757643388.git.unicorn_wang@outlook.com/ [1]

Chen Wang (4):
  riscv: sophgo: dts: add PCIe controllers for SG2042
  riscv: sophgo: dts: enable PCIe for PioneerBox
  riscv: sophgo: dts: enable PCIe for SG2042_EVB_V1.X
  riscv: sophgo: dts: enable PCIe for SG2042_EVB_V2.0

 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts  | 12 +++
 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts  | 12 +++
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  | 12 +++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        | 88 +++++++++++++++++++
 4 files changed, 124 insertions(+)


base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
-- 
2.34.1

