Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A6D21E0AA
	for <sophgo@lists.linux.dev>; Mon,  9 Jun 2025 23:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749510253; cv=none; b=Kizz2Ib9ijc+Beh/GwtKIgBOtlf3Wa+0v7UxGYLPCh0hXVQ1qQPzm5Wbm0ZwQ4zTaEYy62L4KW+4U3qq7RVaZ95Nv9jbqYNUGwT8Fk44dHPdSiUfrRpSDJHGH32q1LJeg2m/lqGo1f5YZn/ATeez4fAe5yoKugt+0pedGtgLjrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749510253; c=relaxed/simple;
	bh=fMuxpwKkaDuVqjxZYFtMLKk5XFibqLZEUn6lpe93dHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fcxoARFp88GxXw6iotQEtMFjgungoIEL2PuQrbUZ6xmMjnEXLflqdSczAaBFI4bnyd7/Yas7fDxH7KLxWSz0zFVnVloOguwNOH11xpMjf9N3hEcGSVoqfygl3SbuvIg5E8DjsBRqXb3ZvAsW262BkxXaHFY14xJoqB+POPMx6+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Trn1M6Xw; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Trn1M6Xw"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so61022265e9.1
        for <sophgo@lists.linux.dev>; Mon, 09 Jun 2025 16:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749510250; x=1750115050; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q52h/lfPwbDwdpVA5o1DRZUJae8sBtBPulv/3hni2vM=;
        b=Trn1M6XwX99lEE4aKG6uw2FtLprJjIehv0RrAlLKONuFKSplULxHsIzKG2D15kYkoG
         2ETmRuh0pJUZAcxkGWysEIO6lueq9khmSd3j8Llj1jwdnbZ6GUjR352wA/bAfAz6VWZ1
         /hUFbbRyEjETofeoPb5IdCfP34hNNu0oHXyhaAJsHJYNuSUQTCi0hCK54xUtNgGQmuQz
         8gq2AlWG1hOU7WVR63QL8cGcIaELakKZtaRhBP6HkgtiBa38eOQ5jKAbAp2rqRBvhFCI
         JeSY2g0hjjjmOz4HVQ60vL4lbsnJ8UV9RLqAUldDm3oxBIzzVFTkrmKekHzEhGeO7NAd
         iuCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749510250; x=1750115050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q52h/lfPwbDwdpVA5o1DRZUJae8sBtBPulv/3hni2vM=;
        b=RRAo3m2Oz9ds18jw0pLzzsBL2d5aBMScHZavDbk5tIgVQG938RBNfFSfAw11nekokl
         j/LcPBLk39NSJBzp0tnqUalVMphV0BiXRE5fLCQ7mEl/bAVcpnEmMrjwl6ZrKFYeb6kd
         7kxB/R49O6MxkhR/NJ1+7xoLPh+5J20EkjEbsdt2DbDP3PAGa2aL4OPTx/ZPzD2pLNxM
         tqmzPB7IO5Vf+SQgO6nl+FoMa1rIt/8+R9GB9q5GUmQnpnlw0oboIuaYncAQ5QWiQj/x
         UqHRKp4L1VEB9oJ/n3apIniuNi9iX9H/qAy7mUauEan3Yj6t9IhGjUGgd8d5axtALCas
         OYEg==
X-Forwarded-Encrypted: i=1; AJvYcCU+yPl8DF3+eBWjtmg/Q/wgmANw9tW5BRiguFQk/uaV6LlchMTClI5tAZ7CHMHTTaT4JOrxQo4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8NZaGD0Ss4UTFH7FlL36sxmDQVcG62N0GpVIQec7rERhUUdaE
	b7GsdKFLHTMX4cI1NhanhjLJhY8BgqRfFHcrYRo1SAeDIwivInZhF0Tu
X-Gm-Gg: ASbGnct4/6VhAPapPrODbmNMmSwkKPi82YdI0zIg0Aor47wxLL6OsBwUAMKKfaVEgr0
	vvoDMD9rby6QBGvL8UxiyQTw17W8lY/z/UaCjD31dWkRSj5WNCbxI0gX7cfhTIGWLxEG/OPZx7u
	czx7MmNyNTwfHB1KlmN8OHjXlD2CECGm6EMmqkkEs3SYLJr7c8bLSjZetJDPnNDp/dXmDOI5BWd
	Z+KnWkOhreUKeUG0jY1McgEp3+raH33f/v551BHiAbSe0EFkFft6S/DnrIBbxLQbsx18NOQv/Gi
	JpFV6XbZKfeeCvR6M0bv1PjIBlqIHEPBgJextI/dwdI4BnDTDsNqGWgHMluEODoA1FskIYe8YPW
	AVxSnfJR+0g==
X-Google-Smtp-Source: AGHT+IHaE50cZViaIR8jpPsU+4oI5U31I7qKoKsPQXD2IoYNvIGGqXd8jWOeVLwf2jPvp1fljphNyQ==
X-Received: by 2002:a05:600c:1d8c:b0:442:f98e:f37 with SMTP id 5b1f17b1804b1-4531de70b5bmr3626745e9.21.1749510250262;
        Mon, 09 Jun 2025 16:04:10 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730b92d4sm121340585e9.19.2025.06.09.16.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 16:04:09 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev
Subject: [PATCH 0/2] Add reset controller support for Sophgo SG2000 SoC
Date: Tue, 10 Jun 2025 01:04:13 +0200
Message-ID: <20250609230417.620089-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT bindings and the corresponding compatible to reset-simple driver;
provide the include file with reset lines enumerated.

Alexander Sverdlin (2):
  dt-bindings: reset: sophgo: support SG2000
  reset: simple: add support for Sophgo SG2000

 .../bindings/reset/sophgo,sg2000-reset.yaml   | 35 +++++++
 drivers/reset/reset-simple.c                  |  2 +
 .../dt-bindings/reset/sophgo,sg2000-reset.h   | 92 +++++++++++++++++++
 3 files changed, 129 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/sophgo,sg2000-reset.yaml
 create mode 100644 include/dt-bindings/reset/sophgo,sg2000-reset.h

-- 
2.49.0

