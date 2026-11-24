Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795505372;
	b=iI0ORGeMDCYd5qVhmPaF6hQOFBKx/eHOQORF3hqsEvivjFilqmgt6Nzf2WiA9YKmg+tv
	 hmbNMtz3Ittl+VF2S3wCYWYbWg+eudBzsz7spRhwetUUz/brqwmecxIYiHU8qd7mYDiSx
	 Z5Cmf0M69Wagy34laE12+tbW5LlAbCNfJbbIf53tv9XQOePsyDDRmfRELUuyxLeyNXx8r
	 aI4UIsEN20fIF2xYYWL41KEj8Liq8rsoa5SfhVTcO2eokfiLC2fI0WQ3RaaSoIvcriH/z
	 XNf3phjHf54SXOM/T73K/J+SrX6MrfKcNGxSIRexEEAQ3tT7bJHk6VGdypoRZy0m0qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795505372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=U4eZKwbLyr5C9ZRawowrZ+u9z/DgLN56Wne8sTMpX3A=;
	b=PKoiNbtb0YRZBK5bMxtFm4KmrR+fY+XafD/j9Z+t9uCnEwVVZz3duhrTrjMnHkmDqnFK
	 VZGEkVgk/8LZFIQXL/v1GEy+YROBqaMSNnPvoOXf8cQm1IudP3vrrAhfhuIot1AykAia0
	 svVTuv7v5hVYbdCsUgGNjgMlXpbtCF3yCfeYvZhq+sR3NMjL8tDAplHgiI17s5KzPdhFH
	 xmq1lIZBYaBYXwfgOov2GZDEEDS4vP3NHpPd7FCZtl3mlLUm+RyWl4fKRKPvpudYBY9pZ
	 VgH0phc2C/ixZzuwfCcjWYsONZWU/Sx4c2WNids2kxpPsB3OKPzhnE+XIjR7stZI3+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LdWj9nEB;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C7D606A321
	for <sophgo@lists.linux.dev>; Tue, 24 Nov 2026 07:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1C7D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LdWj9nEB
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8c70c2ab5a2so1582045b3a.3
        for <sophgo@lists.linux.dev>; Mon, 23 Nov 2026 23:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795505371; x=1796110171; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U4eZKwbLyr5C9ZRawowrZ+u9z/DgLN56Wne8sTMpX3A=;
        b=LdWj9nEBVbtB2zwJqi+vlinRclpnH24BP94+iYNWZslM59MYe2kdE437pKpBzqxHeO
         VD+tMoJ2qYT6QROddqrMF9aK7995bcq7kmOeRDHQtlkuM05MfQV+qLxVPgWK3C6feHB5
         Uj0YU+i23fWzdkI9SuHuyB4S+xGYQTdReQ9epTxd4smyYCulhLddermdTeCPidp6+J/5
         uTHo3QamHuptaGT41SLR0tgk7xgU4cE/rQeGUG0Fcf8EE3RDCjnhbbNtr3ujCxcV2tj6
         OSdnxt89g0IxkmjdEel3mDY59skll4OAsURZQBfISUp2vpGH5ZRLIRyIUTd/VePz4e1h
         0ZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795505371; x=1796110171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U4eZKwbLyr5C9ZRawowrZ+u9z/DgLN56Wne8sTMpX3A=;
        b=WhvFEaOY27VxNt4KvVC9J2usbdio2DgoXnReBiD4kRWWL4bZc1qH03LsXLbJkamF07
         iPpr3QlMjtBJC5XARhvOdvxnorbq6DFjJKrOHJKLw+1YQQRlq29IvsQ77sBARq7CPqdi
         I2INpoF9iVVXgpvUyn/7iUoKP43+dQJVNP49CoiXFA+rW8eGW/cBg0Xu6/XeL0pScv4i
         tlJLCmuJW3f1DDvL90sVtqHIAVR9LCKYWM9BhyKt863etvurGMzfwZc2N0v8QVHC0ZSV
         Ld2H3KrGO9vJfXJTNuzgqPOPM1Q7LEfP0lOZu5vrFeZP0/q8wusPlVGDTO1XsF+Yqkf4
         fBxg==
X-Forwarded-Encrypted: i=1; AL+hErFnV+/SRyJ6KSXnAnZgGhteDKgSh2mH3o3u4p+L/+RJdp/H8VgAwE0M/l4ddi5cZrQWRppx0Nc=@lists.linux.dev
X-Gm-Message-State: APuU4Z8P2GNVFgQRQ7E8euPweLHCK4e7eUB6eeCx0ws2gkZOhpcwfKau
	U7Ybaq5e1dLNxEZ29OHMB4pOKiHjrz3Nh2YRg+QhrlwEaR3DPbB/5r6w
X-Gm-Gg: AZFdTZdUURwO7k5jZZZxAIIVc1ycKopBtIicWO/w4Wa/JfEtuppO7njJUEgCRK9swyb
	3BT9EksE0G6Am9+6sxRjDp1zFgDK5jLwD/FOX/IUZA8gX/9HKDmnl0Ugn6L9JmRMX/BKfFvGPxP
	0gp6zwGp2rvADJdiRxCasn+HAhwMDoCmIjXCHFDWEvWubNfWoF6le57oHYocVEFyPqIiC+hMbuR
	iIwGjiNvDsCSWUkNOvVGrSpviW2ym1KOzI2OAhfyKakMHWRMrtBXzJPWduPWiAy8c7oGRhbhSuv
	BT/nrKG4VjqHox3ukk/DHO+XCqnzOYETUbIofK2mIsNFVq2KME2278xh8Ax2rYnwnKExecWBTiI
	bHulOD2ReCnqpSCiR3ig/lpIe0UUPhN96OvmwwofKaUd1HXLUv9l4zDIXEsjNI8YGcs918Lu0C+
	BbHp8t6V8UD+mzPu+L0Fp1+2o7OxXEOYoGWqhuMjf5KKKbfnnFLuZpONeMu1vsRR19AhDAj47Tb
	8L8bd6J5l2vYeaxJeDwJc4HNnAtthFgH9az1Nov8beZVOhQ17/d+vS8V8KqRlCq21cCOC7ESgFR
	61HrAQphQK/DYLn0kZhk8zXY//8=
X-Received: by 2002:a05:6a20:dda8:b0:402:4f40:c761 with SMTP id adf61e73a8af0-4024f40c789mr8567537637.37.1795505371142;
        Mon, 23 Nov 2026 23:29:31 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc613csm6519888a12.5.2026.11.23.23.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:29:30 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <gaohan@iscas.ac.cn>,
	Hangfan Li <lihangfan@iscas.ac.cn>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 0/3] Add SG2044 eFUSE driver
Date: Tue, 24 Nov 2026 15:29:20 +0800
Message-ID: <20261124072924.556678-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Post: <mailto:sophgo@lists.linux.dev>
List-Help: <mailto:sophgo+help@lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sophgo+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SG2044 eFUSE driver, The eFUSE contains factory-programmed data,
and it will be auto loaded into shadow registers while startup. So
only MMIO read is needed.

Change from v1:
- https://lore.kernel.org/all/20261014074516.240247-1-inochiama@gmail.com/
patch 1:
1. Remove clock-names minItems.
patch 2:
1. Fix wrong buffer size in sg2044_efuses_read().
2. Fix return type of sg2044_efuses_read_strip
3. Fix some style error on the driver.

Inochi Amaoto (3):
  dt-bindings: nvmem: Add SG2044 eFuse controller
  nvmem: Add Sophgo SG2044 eFuse driver
  riscv: dts: sophgo: sg2044: Add eFUSE device

 .../bindings/nvmem/sophgo,sg2044-efuse.yaml   |  59 ++++++
 .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |   4 +
 arch/riscv/boot/dts/sophgo/sg2044.dtsi        |  12 ++
 drivers/nvmem/Kconfig                         |  12 ++
 drivers/nvmem/Makefile                        |   2 +
 drivers/nvmem/sophgo-efuse.c                  | 176 ++++++++++++++++++
 6 files changed, 265 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/sophgo,sg2044-efuse.yaml
 create mode 100644 drivers/nvmem/sophgo-efuse.c

--
2.56.1

