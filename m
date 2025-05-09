Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A416623185B
	for <sophgo@lists.linux.dev>; Fri,  9 May 2025 18:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746814441; cv=none; b=qHdmKf2Q240H333cnhhJWHUSq8Q3TUOXS7MRfwaBWHFIuCrRde88HyH8HollvZ0FwGBRIdYnmDDsJyTVtVr0CSmHf4EC6DGZw+M9LOd0YDa/lnnmJxUPsd7ln+GU/RpjM3gBrRUz8Hjh4AD3KR/2xoEunwC7johJA1+ilH9SsLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746814441; c=relaxed/simple;
	bh=q2efZcS2vewZvZvxX5GnQfpsm2S/1Rw+OXcdg72+AUM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tq0zuZWNsVmFBwICVP3YLoxc25WHZm9iTwnu4Qg4fWLqeDNXfu2dyuxqzVU7i152QBiE4R9ZMbo6U609vSrL2XgsGjONbmsJUc1pb02tFAI+3GQSmYwpvCYQceJ+5qND40U5cUoocGjy5ClV1CoaStmnRfcQ23lm9cl5kiL57sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NrSrWK66; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NrSrWK66"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-309f3bf23b8so3043182a91.3
        for <sophgo@lists.linux.dev>; Fri, 09 May 2025 11:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746814439; x=1747419239; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FPj7I32OmBW3NmJfN6lCorE6OcW6uOYiL6FFTyzHkt4=;
        b=NrSrWK66N73LxcZ/9rcHzXaI6CUjQvRx3avOuaEAG0+hyS27kjDAwDWbN69oK63WvR
         RQhPV4PSLN2A/PHe1OzbsYrJHsfiRZD+kAIOvCW/HvazPtaT2dZjmWnA03berqJbFSsI
         CXy0eb2NkJgYHGtFkEr0h+SiQyEhNI6E4KbXDy8ouTDBDZW3+zTZY9dGwBtxVy+GGDUU
         oD+m5RYCwJ8fZQaKn8daxGLBTVUWRDhYvyzY+qjvMcFM7LQ99Hms6kALGS/5Of3Ysom/
         tBafD986sYTvUXsD8+5tKfyjLY5mI3iCzfmjM+y7jkcmqEvxXXLQjgZ5IZzaFXz3XIQj
         YrXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746814439; x=1747419239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FPj7I32OmBW3NmJfN6lCorE6OcW6uOYiL6FFTyzHkt4=;
        b=GXFVshCuOhNVPGYeEbdGU8c4xVPJo7ZWgE6KcX90uiqR1gQGDw+F+07R1UUm1IAMm4
         6i7fFJf90BcnSoP3ZY9W/PZdB7OO4bokOsEI+LmSlRlNnDGoOQrmyXh5aXedsVXFN4bx
         aObOgyArNcYDAL8nEkS78d9/qv68qfl+AsC6t1q87JDiPmAzVvUHNgW6n5SbRDuvMuui
         f7l031ehurdBmcKdrxT/ssoFBMCB8Vp1ZUAvpkWZHpHdvk7lSpar/VzIUB7lriG2SolQ
         oCXqJsu8+CB755BsYGH5TTB3UODt+iK6PNLZ/tDLBWE3KcL4Ay834ACsRrUthz/BZr+T
         K9SQ==
X-Forwarded-Encrypted: i=1; AJvYcCUphEdnGmtm9+EcgfzeWhw0sTpvJVImyruT1Fm52kk3pAdthU4ZAY7OdZlhKhiKa3tbXV6gGvA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZ5LY/7c57b/QbMPBGbZzblDJq4va/eykzVSH65VFJnxXeWF57
	Q6nD+2cdOEyyu3PlHNn1ss5p/liKLy+mA6XGujTVhBbsFN+O/WuM
X-Gm-Gg: ASbGncserLoasETAobMtIyXA763aoWb/+YU1MLeu4nkwlLkocbemiFTuvipFb2A2/xv
	qa9oyWc3WGEK9R9SkDrchIHW2pe0XmJ1Vd/V7WErCaA3B2bw24bFQ8aoI9KIcv1clbgwtcLruny
	zCI/gY0K2+878K+WkClK6WVFL5tLVsDNlpBu9Hw/HZMa4MX1rPxfY///kpdalA7EF4VtzwhY6eP
	vVDkitsujHf4hvLrIv2qzc8nGgYvV/U3VySYjAFEf8pgURmFf4QacNVg+NWEO5zQ/wGPxRI19+l
	3h5hVVdre+yjLEpAdlcSU9OQR3LezCdMkorksNCMBDLpo/ILGByiEDvOMl5cqQ==
X-Google-Smtp-Source: AGHT+IFfDKuX+Ogqxn1Bz7Jth7H250NjxWVtd3CHGpPWzJnTEpjnMQCpbk5yL8+PxsceCiC6uJchgw==
X-Received: by 2002:a17:90a:dfd0:b0:2ff:6a5f:9b39 with SMTP id 98e67ed59e1d1-30c3d3eb4e3mr8275448a91.18.1746814438302;
        Fri, 09 May 2025 11:13:58 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39e61083sm2127309a91.30.2025.05.09.11.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 11:13:57 -0700 (PDT)
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
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Add Sophgo x8/x4 EVB Board support
Date: Sat, 10 May 2025 02:13:26 +0800
Message-ID: <cover.1746811744.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sophgo x8/x4 EVB [1][2] is a prototype board based on SOPHON SG2042 [3].
There are many of these two boards in the hands of developers.

Currently supports serial port, sdcard/emmc, pwm, fan speed control.

Added ethernet support based on [4].

Thanks,
Han

[1]: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x8-EVB
[2]: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x4-EVB
[3]: https://en.sophgo.com/product/introduce/sg2042.html
[4]: https://lore.kernel.org/all/20250506093256.1107770-5-inochiama@gmail.com/

Han Gao (4):
  dt-bindings: riscv: add Sophgo x8 EVB bindings
  riscv: dts: sophgo: add Sophgo x8 EVB board device tree
  dt-bindings: riscv: add Sophgo x4 EVB bindings
  riscv: dts: sophgo: add Sophgo x4 EVB board device tree

 .../devicetree/bindings/riscv/sophgo.yaml     |   2 +
 arch/riscv/boot/dts/sophgo/Makefile           |   2 +
 .../boot/dts/sophgo/sg2042-sophgo-x4evb.dts   | 235 +++++++++++++++++
 .../boot/dts/sophgo/sg2042-sophgo-x8evb.dts   | 247 ++++++++++++++++++
 4 files changed, 486 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-sophgo-x4evb.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-sophgo-x8evb.dts


base-commit: 550de367614f7a9a0c1d40d7e19764aa9305009a
prerequisite-patch-id: 7a82e319b011e5d0486a6ef4216d931d671c9f53
prerequisite-patch-id: 5a30fb99ec483c1f5a8dca97df862c3a042c9027
prerequisite-patch-id: e0da79790a934916d9fc39c18e8e98c9596d27ab
prerequisite-patch-id: 84d1e1637549f632729eaeb7cf935ca78a642fe3
-- 
2.47.2

