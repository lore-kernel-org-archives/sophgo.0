Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364FC3128CF
	for <sophgo@lists.linux.dev>; Tue, 20 Jan 2026 03:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768878152; cv=none; b=eUHmo4YYQ2Rmi1Wk0wc1yW5MwURuQY/n5aPbNrXTbI81XmMAQqzdkISb9iqn33h/ttpD5KBGDQi5uewrB1qBxJO2xvmlKG6NuxbLU+VsNHzJh3GE0RmrVIdajLGjg3c2rZdx1hzalTaFIgrhmv7/CY2WVYTz4iT86jsihKUcK+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768878152; c=relaxed/simple;
	bh=su3uEXlT84BJihz2o9XFbF/J8Fa9DMBq2JoIbnsewPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HcXzn/F3rEIfkpxZ5cvbIdwlSOcxgi4WYVTS9y52ytBceG7SgAFYcjQUeD8AbO1yWI0HAZ28z+sPCmBjbv0FojAPWZDF1QbUBZx3IqR33nARHDJMJae+6NyRICYvbucOy3Y+Gsr3gIJ2kgoCt9F3wqS0Z7f++oIehAaPuawQkyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OiCThyok; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OiCThyok"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-94803734b11so119837241.2
        for <sophgo@lists.linux.dev>; Mon, 19 Jan 2026 19:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768878150; x=1769482950; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gv5G6VMcszifsvErGVwkIh6g0xPeD3R1+Dyj40SWmEo=;
        b=OiCThyokeZ51ZcxOYS7J4C9rBPjoYBtL0+FCViltNOKLYongKzj3sghsq/MG8wTcFj
         xUFohbE3m8Z6jCSLKIOFZYffI9A1w7nK2GW+tWllN12BlPFOsPz/3HjGGanOwqZ4jU9C
         SG1fzlzR0JVThBTM+chWVqtqNTcG7cSVFAAlKZRO5P2LB2Krj4i9t/ccf0NZBDUSSrb4
         TylFHGuFekJAyMHnUF3af6wQIKTKrLu4CCnytLNUK6SS1dBCzpdvLhdC5ThsycrpG9Ov
         1w4cHdO6pNqmpyN/iiqd+hBAqHSzrv2cWgD24RP/lK/mu4PM/aWSRcXcbC46QpuV+2Ek
         yTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768878150; x=1769482950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gv5G6VMcszifsvErGVwkIh6g0xPeD3R1+Dyj40SWmEo=;
        b=BntV8WNWqTd2+wRUiqWV4QU+ANb3vObS6XwRMaYZU5Vhs/4vN49SRBwFDB5WlSG+q7
         5LHG5tQDwHbVIft70SyrvP81oVyyYRzUnLqQVdP7CR+lO4P9FvLURr7kPmyrUm1UuFhQ
         0dT5OGDXqL4Az8+1SgqtacMBFZrNIYwKe7TUJsQDA1whYKohj8cgTZ74WiTSV0yTJHTw
         vNXLtLtNXhrUIRfvyKCFxs5vzTSuGqmRuQgXZsSLOatiHA+yTzn4gQ/dq3XZj0SnSNyV
         To+UobK7eM7XTgUd0TcuwQa2PfukKp39X2VBo2Sz0nV87MXcIEo2L2A4fOz3ZO0uVCMU
         JV7g==
X-Forwarded-Encrypted: i=1; AJvYcCXRHjHO27fpOcq7T/FOvEG21mOWMccubili6hNcR+PpxqNjN3qtoWR8wx1tyoIf7cg1zdI/ydg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzp2fzqogKMLeZBeGFo3sDkemET9/gKCQ9ONYwt6iBSvuJ+X8w4
	HKiguN1DtYFKqKxbuSwBhDUB6Ug6Ie8gdKZhtJ9tgRAwLF7yBnyVZVQHu75zFTQB
X-Gm-Gg: AZuq6aJ62uJ1WG2xLD74It0GKk7jVzUS7Rzp2ha//OPybid4tuNzz7BQO5Ob0aeQwnq
	i5QhVOhiQbxUBLIkxJhyz77XUA9VChb6UTMsoj73QhAtTPkBN6iXUsPr1pkvo8y9tflMqMRTZtO
	sYFsYtgh3YAJ4c5OZ/pqdva8gWaLoS4VveC+hcfUL2ETQ+md1ZBB3oMXcXBE6HcbTGU2p9pSICF
	Wc2QyGRdMy4sTUXLYQs0iwzWqmDE3ITPjBiiAt6pViHqMjNb6nGqESYIoU2HbMabG3HYD50JoUV
	sphovxlKHtGX+JrKEe95RE5eq02/tDlS7zONfI/6LFvmTnnkCV4aUCpr/VgvGd15sVnFrmLrnxF
	K8bKbS3i4e5oWCeusp1sgzigslC5scymNmkjE0T0n65PrTFWKWxG15hFuzEE9OJuPlH10jvxcGH
	dt9zXszQo8Yw==
X-Received: by 2002:a05:7301:fa12:b0:2b1:7910:b0f9 with SMTP id 5a478bee46e88-2b6fd7c5909mr186113eec.42.1768871788943;
        Mon, 19 Jan 2026 17:16:28 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3503a30sm16787462eec.13.2026.01.19.17.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 17:16:28 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Nutty Liu <liujingqi@lanxincomputing.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Zixian Zeng <sycamoremoon376@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/2] riscv: dts: sophgo: Move PLIC and CLINT node into CPU dtsi
Date: Tue, 20 Jan 2026 09:16:15 +0800
Message-ID: <176887176535.427065.12899087990982068409.b4-ty@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113023828.790136-1-inochiama@gmail.com>
References: <20260113023828.790136-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 13 Jan 2026 10:38:26 +0800, Inochi Amaoto wrote:
> As we have a separate CPU dtsi file, move the PLIC and CLINT
> node to the CPU dtsi file. This will make the sg2042.dtsi force
> peripheral devices, and make the CPU dtsi force CPU related
> devices.
> 
> 

Applied to dt/riscv, thanks!

[1/2] riscv: dts: sophgo: Move PLIC and CLINT node into CPU dtsi
      https://github.com/sophgo/linux/commit/5e6836e735f9c9c5e8e1d1dce02dfed5fe566e8f
[2/2] riscv: dts: sophgo: fix the node order of SG2042 peripheral
      https://github.com/sophgo/linux/commit/ebb87dd74c34a76e1e93041e9329cf9269be35ed

Thanks,
Inochi

