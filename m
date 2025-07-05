Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6296134CB
	for <sophgo@lists.linux.dev>; Sat,  5 Jul 2025 07:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751698837; cv=none; b=ek67HZv8+ZoggQaBfm6fvAWM52qMg4nD9455NDS9GhkdZMKC5adQcFba/E/PhcHs5KkUditXR2N2ujKa8hNjhKHOkIDFESYErPYOoCAQLBFXsvAzXyhGDpfoKESRX2mrCpo2d33L3hRfqWTdzST/Rpp51VAVjKOf8rUgSNVoM50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751698837; c=relaxed/simple;
	bh=UbB+teRlheEX2h1GboUmQdLUHrxkTF24Qmo6xyVBcAA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uIM3qLRDKYbaAGlNqpwNM8NSYjgX6MUMIbNpc2opEQxpZPasf008ZpEvXgD9m9xj0jHayd77sAj7QJE3ueAwYonZ8DfwaIlKxH1w2OVAfTY7ZpZl3t2hZ2uShjohM1n+XH6STB/Bx9Iqnw8ihKV+a2RqTZKgSX612cmCDLGzfNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R1/7K5/N; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1/7K5/N"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-74b56b1d301so927268b3a.1
        for <sophgo@lists.linux.dev>; Sat, 05 Jul 2025 00:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751698835; x=1752303635; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nssAUAlhMduaAjfLKEY31UHSStHFXQFJc1UCeUJTUOU=;
        b=R1/7K5/NCyRCWr9k8/tQ4++VCEOwsvv6gzDSiRaFH+d4RX34kTZRSlt452atlPc1X3
         pj0YXL0iIPsRdKcZKYfTT+/Vh1YNycBYPEcpgnQhDSvh9uljwA5uuZ0YvjXur4L/la6z
         nsOePRb7O1+t49Y7T1mjSggwy2z+cKdzqR/AiUrgGGHsYNz2/sucolTT1uG/VMKQBuHK
         GNz+jmlC9R3Cyi3l/zs79rMi/AGv4CBv67UHSmp+JSWy7W4lxvTkhHx+BdWr9151q7aP
         6b677ZMSSQDxK8djeMZOYo6hrkkCHzJ+gu4rqceyzgoHv8GffTsHv4bw9IWv0vk7+EFA
         ze1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751698835; x=1752303635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nssAUAlhMduaAjfLKEY31UHSStHFXQFJc1UCeUJTUOU=;
        b=Ct0Y7Sc6dGhqy31ogQ90W6rs5wB63jb+IpIG5l0IIxlijrOHCHOEUu4ktdxqQ80n3i
         QIDKFEjubIe6zyxxxq1DXomLfRgEBtnKs30+o0S6ZG32FKXPexeGbXjY6C/0ya20BIsR
         FHwoi3fDxOhSThyR2S+nM8Ao1QDW3y3FzLNc4pHGaj2vCVjtzHZEZddixOtQDZAktEr9
         i7iN0OzHgQ87/MB6fEvYvF2RYHB45zJtqyj9ubsOzoh7KfVhVs04LQ1HOQQrFF1isj2V
         PWQaqoqaaCet458Vdq7etH/W3hCQIcKQHSWe808vqyNd5q6wGSs7I5lm4QAhPjiurzyA
         DK2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUwe9VuViBHG5GfBbpvTcEW9cEghJnW5GIXGPiWp9wP1f440mlafonaddp0SBS99esMllN3HVQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YziK8ieoFCoGvIH0mlOZoFb+Cf+f7x8J+mZUkkmTFVUAxM1pqFR
	E+MpQMTnOouLj+gwFBLjRf/zVbAzW3NtCY/UWdNjoX/hAZ1+72lrBoIX
X-Gm-Gg: ASbGncuLIS7Q9ZypfG2YjI52zplfWoyJZPuVj6BfgcjkHINu1GmX8Nta/EfPat8c89j
	2J7N3v4TfwAVJzOVn74R0Kms/bRLwTrPUmVwInF4mAUwfzRwfrdPjkgHt5qQJoA9sVZiFmHNi7I
	x5Za1huOFfzKTuMuK7EWXI5ho/vQCidDa46BgItdTYlbXqDuDfgR9lW10KLsCXuvLbMfxa6pkkv
	KOkM+x7B3Qwb3++QK6GwcafnNpcn89lSio4Qr5fDSJ2ZwtLAt+kdGsshsCPNuIFNFSJHtc+nwVQ
	+fpa7arISOJKv/VlfmTWXeJlg2emTe1DhrCTib6vIurTmNgZY12BNQQ69EXiJ8UOIp7EMdom
X-Google-Smtp-Source: AGHT+IGvNv873ht3zYXKYDK4jQOR12YQwVSFK97C52NvA93Agip6zuoIuhrdkBpAwe1Y1Kc/3dsQpA==
X-Received: by 2002:a05:6a00:928c:b0:742:a77b:8c4 with SMTP id d2e1a72fcca58-74ce8824f1bmr7863083b3a.3.1751698834683;
        Sat, 05 Jul 2025 00:00:34 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce43d5186sm3638341b3a.169.2025.07.05.00.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 00:00:34 -0700 (PDT)
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
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] riscv: dts: sophgo: add more sg2042 isa extension support
Date: Sat,  5 Jul 2025 15:00:11 +0800
Message-ID: <cover.1751698574.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add xtheadvector & ziccrse & zfh for sg2042

Thanks,
Han

---

Changes in v3:
  remove zfh in riscv,isa

Changes in v2:
  add zfh for sg2042

v2: https://lore.kernel.org/linux-riscv/cover.1747235487.git.rabenda.cn@gmail.com/
v1: https://lore.kernel.org/linux-riscv/cover.1746828006.git.rabenda.cn@gmail.com/

Han Gao (3):
  riscv: dts: sophgo: Add xtheadvector to the sg2042 devicetree
  riscv: dts: sophgo: add ziccrse for sg2042
  riscv: dts: sophgo: add zfh for sg2042

 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 384 +++++++++++++-------
 1 file changed, 256 insertions(+), 128 deletions(-)

-- 
2.47.2

