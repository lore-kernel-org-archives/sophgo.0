Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B643CF04F
	for <sophgo@lists.linux.dev>; Tue,  2 Jun 2026 23:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780441984; cv=none; b=EU/r2xxlK/GscNQZ+rNwDRbKYIx3ZDin/BejZHG9HMI2PlrYAiDNUKwLJ0Hxhi2FSScRTEiRV/hi2mD71TIEiR7RGEE+T4QTy2IxlqQi9BsP6sKNWxB6OhCbFDHiBMt+Z17ivPTpTh63dh75yp0OIj6vQhMnFZcQvt76rM26yog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780441984; c=relaxed/simple;
	bh=i+bSIzD9+RiKWCP11BdhBb8f9cURvGwMJkPT72+TQ9A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PP9CVQd/P72fzytdhP0ZMt4Xjn0TfZeUcpZkKOzLmaaq682sAWf32bTjED7TKHM8+W/HWecjrn1/OZeRZ7FNw21El2oSSAK/ySHlNassEQsFTxDAJmoeoIQGHE7XcOhKEC6os7SRidjQaAqjKHTVFPjN1UHqSL1+rF+yo2p8asg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hDFCmXP0; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hDFCmXP0"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2bf125989f2so38918115ad.3
        for <sophgo@lists.linux.dev>; Tue, 02 Jun 2026 16:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780441979; x=1781046779; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=at7eAXfC0U9LH2oH4voN5YpVnxe6Tbb3DG6Uoa+BbDk=;
        b=hDFCmXP0S3gF0Q4BBOeYwtwxnFbKsrPFAcJu2kO37iNJT9vrYj19XZoUihTg5SeU7R
         yfpH6a0MCi7iOSafie74s2dgCdO4a3KVReEr/FonZi3+U3MzVexAiGpalnqbxiIr6poL
         oTohibvlbsywdRwbFxkqjBBBdf40yIjuhqiYjYWZ6DWR1OxKr8ZDV/+J3DBinZ5O51a5
         rTyHusF2Msp7VPkHrR1yvVzn6P3g1Do7YyuiCZ2ZZ4XtOvV3lVlK7LMNMUTB2glBfiiV
         G/MKoL+0Dyz3rGe/2V4p/gRd0t8J8kZ7IQ4wRD83Jn7xbamXiaw4gMpr41a8IDuD1w3I
         szxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780441979; x=1781046779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=at7eAXfC0U9LH2oH4voN5YpVnxe6Tbb3DG6Uoa+BbDk=;
        b=rTUubkGW1Vj9l+TZruPGtJnLdXSO6petx/kNayFs54jIDTVE95Ild9dndEFx7MYjAz
         b4Y1oT6HQGefb3k/E7LRgBsANSBtaRg83ORV56mNxQyfXdIcrKb77UkUvH2YCJg4n6H/
         9FwZKA9BS13wwF9NDKrWEO6dU9Sv/0S288L2VBvkF3Jffmtt2rohHO32L0P/PfLKN2m5
         KHxY4KuXrpKxBeXcBKqC0IKSOLirxHJpe6pzMhfZ08JJl41Nyw8PhWsF0T6RJR4Ityd/
         o8UKDK1cnehHDmGSKPg/bZzCtSUKLb/5EcJ4GgMULAPR7AEgLyzqkRUox6robCLat+nz
         d+XA==
X-Forwarded-Encrypted: i=1; AFNElJ9rk8H5mQcDw01xNpLXm34B+JvyA9RY3IoASdrSmc4fPC7Vvcj/rIrhfGpfqYDNQQLWdf1h2L4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyFZB8swjxa7A56+MDW9qDgtx4tp6KrTyB7JuztdK/5JDdElVAp
	DnGQJHnQW8pmFdu7gSz74FIbBplTfGJp1jDT6Tl/dIVxx2kVtqaxW1dt
X-Gm-Gg: Acq92OFG67oww9GXJgpu6npMJwkR4KPapG/7E5kd715jMkCy3UGmDn6+pEB8T2/d2KV
	KtM0K1tWvNjZ2DGJ+HIiehYSKZ0jkd6aoZNgK5o42WEhJfz0O8nFSOdXH+iCPp6cKD/nsF3tEBh
	oFBAPEF5Xk/TQMhPw/n4Oi5kFq13UXhacch64Lw4wSkxchI1mKseGUBzQP1iTX2mhpnrUkb3+xQ
	LGQL4IN0bNcIyCvVvVEK1fCCMop500DuEjIPtp5CBoCyjKOYF2auFtd3IVpC9HymFosCahXyg87
	66keZhtQSotNXvlzqNVcflTUMSsDsiuoiBxoNX10GwYbu3TcMj+xb41M2hrm0kNC/fgwJtHyj3a
	OymfXohfs+xBd2XliUiVvCz60KwYe81z09mOHQh2cC70qnwXB3MPadgkI6gIm3cyRqYx1XFb3CR
	g6dy+yxNh3b00hSqPEZpyW
X-Received: by 2002:a17:902:ce87:b0:2c0:b4f5:41e0 with SMTP id d9443c01a7336-2c163d8f7fdmr6885635ad.26.1780441979026;
        Tue, 02 Jun 2026 16:12:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649d2dfsm3302965ad.75.2026.06.02.16.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 16:12:58 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 03 Jun 2026 07:11:56 -0400
Subject: [PATCH v3 01/15] riscv: hwprobe.rst: Make indentation consistent
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-rva23u64-hwprobe-v2-v3-1-5529a7b28384@gmail.com>
References: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
In-Reply-To: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Shuah Khan <shuah@kernel.org>, 
 Christian Brauner <brauner@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 sophgo@lists.linux.dev, linux-kselftest@vger.kernel.org, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Charles Jenkins <thecharlesjenkins@gmail.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=20508; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=jQ+FZ1a4caFuCxBYqE0mSSFty3fjCcqiDo3iX06WP7Y=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiwFHub4ddWsl1beWbpj4xopx3qvKwz7152L6d3As2G7d
 YPG4Sk6HaUsDGJcDLJiiiyHj7Zkb33lE+37nPMHzBxWJpAhDFycAjAR/ihGht/hCVzTZ/8J4Lwe
 rr+MeTnXE90f395Fabuaz6rsnDklfjHD/5rJGpMOpr5eeoflc73exQ2LQmutJnG/T6z/an7llfL
 L8+wA
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

From: Andrew Jones <andrew.jones@oss.qualcomm.com>

A handful of vendor-extension entries indent continuation lines with a
tab character, while the rest of hwprobe.rst uses spaces.  In addition,
many list items align their continuation lines under the 'm' of
':c:macro:' (column 7) rather than under the item text (column 4), so
the file mixes several indentation styles.

Replace the tabs with spaces and align every list item's continuation
lines under the item text, giving the whole file one consistent style.

Whitespace-only change, no functional change.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
[Guodong: extend from tabs->spaces to normalizing all continuation-line
 indentation across the file]
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v3:
- Move to the front of the series.
- Extend from replacing tabs to normalizing all continuation-line
  indentation, so later patches add documentation on top of a
  consistent base (Andrew).
---
 Documentation/arch/riscv/hwprobe.rst | 194 +++++++++++++++++------------------
 1 file changed, 97 insertions(+), 97 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index c420a8349bc68..a09a8f16bd16f 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -82,121 +82,121 @@ The following keys are defined:
     version 1.0 of the RISC-V Vector extension manual.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZBA`: The Zba address generation extension is
-       supported, as defined in version 1.0 of the Bit-Manipulation ISA
-       extensions.
+    supported, as defined in version 1.0 of the Bit-Manipulation ISA
+    extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZBB`: The Zbb extension is supported, as defined
-       in version 1.0 of the Bit-Manipulation ISA extensions.
+    in version 1.0 of the Bit-Manipulation ISA extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZBS`: The Zbs extension is supported, as defined
-       in version 1.0 of the Bit-Manipulation ISA extensions.
+    in version 1.0 of the Bit-Manipulation ISA extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZICBOZ`: The Zicboz extension is supported, as
-       ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
+    ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZBC` The Zbc extension is supported, as defined
-       in version 1.0 of the Bit-Manipulation ISA extensions.
+    in version 1.0 of the Bit-Manipulation ISA extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZBKB` The Zbkb extension is supported, as
-       defined in version 1.0 of the Scalar Crypto ISA extensions.
+    defined in version 1.0 of the Scalar Crypto ISA extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZBKC` The Zbkc extension is supported, as
-       defined in version 1.0 of the Scalar Crypto ISA extensions.
+    defined in version 1.0 of the Scalar Crypto ISA extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZBKX` The Zbkx extension is supported, as
-       defined in version 1.0 of the Scalar Crypto ISA extensions.
+    defined in version 1.0 of the Scalar Crypto ISA extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZKND` The Zknd extension is supported, as
-       defined in version 1.0 of the Scalar Crypto ISA extensions.
+    defined in version 1.0 of the Scalar Crypto ISA extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZKNE` The Zkne extension is supported, as
-       defined in version 1.0 of the Scalar Crypto ISA extensions.
+    defined in version 1.0 of the Scalar Crypto ISA extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZKNH` The Zknh extension is supported, as
-       defined in version 1.0 of the Scalar Crypto ISA extensions.
+    defined in version 1.0 of the Scalar Crypto ISA extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZKSED` The Zksed extension is supported, as
-       defined in version 1.0 of the Scalar Crypto ISA extensions.
+    defined in version 1.0 of the Scalar Crypto ISA extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZKSH` The Zksh extension is supported, as
-       defined in version 1.0 of the Scalar Crypto ISA extensions.
+    defined in version 1.0 of the Scalar Crypto ISA extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZKT` The Zkt extension is supported, as defined
-       in version 1.0 of the Scalar Crypto ISA extensions.
+    in version 1.0 of the Scalar Crypto ISA extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVBB`: The Zvbb extension is supported as
-       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+    defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVBC`: The Zvbc extension is supported as
-       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+    defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVKB`: The Zvkb extension is supported as
-       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+    defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVKG`: The Zvkg extension is supported as
-       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+    defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVKNED`: The Zvkned extension is supported as
-       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+    defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVKNHA`: The Zvknha extension is supported as
-       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+    defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVKNHB`: The Zvknhb extension is supported as
-       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+    defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVKSED`: The Zvksed extension is supported as
-       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+    defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVKSH`: The Zvksh extension is supported as
-       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+    defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVKT`: The Zvkt extension is supported as
-       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+    defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZFH`: The Zfh extension version 1.0 is supported
-       as defined in the RISC-V ISA manual.
+    as defined in the RISC-V ISA manual.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZFHMIN`: The Zfhmin extension version 1.0 is
-       supported as defined in the RISC-V ISA manual.
+    supported as defined in the RISC-V ISA manual.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZIHINTNTL`: The Zihintntl extension version 1.0
-       is supported as defined in the RISC-V ISA manual.
+    is supported as defined in the RISC-V ISA manual.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVFH`: The Zvfh extension is supported as
-       defined in the RISC-V Vector manual starting from commit e2ccd0548d6c
-       ("Remove draft warnings from Zvfh[min]").
+    defined in the RISC-V Vector manual starting from commit e2ccd0548d6c
+    ("Remove draft warnings from Zvfh[min]").
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVFHMIN`: The Zvfhmin extension is supported as
-       defined in the RISC-V Vector manual starting from commit e2ccd0548d6c
-       ("Remove draft warnings from Zvfh[min]").
+    defined in the RISC-V Vector manual starting from commit e2ccd0548d6c
+    ("Remove draft warnings from Zvfh[min]").
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZFA`: The Zfa extension is supported as
-       defined in the RISC-V ISA manual starting from commit 056b6ff467c7
-       ("Zfa is ratified").
+    defined in the RISC-V ISA manual starting from commit 056b6ff467c7
+    ("Zfa is ratified").
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZTSO`: The Ztso extension is supported as
-       defined in the RISC-V ISA manual starting from commit 5618fb5a216b
-       ("Ztso is now ratified.")
+    defined in the RISC-V ISA manual starting from commit 5618fb5a216b
+    ("Ztso is now ratified.")
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZACAS`: The Zacas extension is supported as
-       defined in the Atomic Compare-and-Swap (CAS) instructions manual starting
-       from commit 5059e0ca641c ("update to ratified").
+    defined in the Atomic Compare-and-Swap (CAS) instructions manual starting
+    from commit 5059e0ca641c ("update to ratified").
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZICNTR`: The Zicntr extension version 2.0
-       is supported as defined in the RISC-V ISA manual.
+    is supported as defined in the RISC-V ISA manual.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZICOND`: The Zicond extension is supported as
-       defined in the RISC-V Integer Conditional (Zicond) operations extension
-       manual starting from commit 95cf1f9 ("Add changes requested by Ved
-       during signoff")
+    defined in the RISC-V Integer Conditional (Zicond) operations extension
+    manual starting from commit 95cf1f9 ("Add changes requested by Ved
+    during signoff")
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZIHINTPAUSE`: The Zihintpause extension is
-       supported as defined in the RISC-V ISA manual starting from commit
-       d8ab5c78c207 ("Zihintpause is ratified").
+    supported as defined in the RISC-V ISA manual starting from commit
+    d8ab5c78c207 ("Zihintpause is ratified").
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZIHPM`: The Zihpm extension version 2.0
-       is supported as defined in the RISC-V ISA manual.
+    is supported as defined in the RISC-V ISA manual.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVE32X`: The Vector sub-extension Zve32x is
     supported, as defined by version 1.0 of the RISC-V Vector extension manual.
@@ -214,84 +214,84 @@ The following keys are defined:
     supported, as defined by version 1.0 of the RISC-V Vector extension manual.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZIMOP`: The Zimop May-Be-Operations extension is
-       supported as defined in the RISC-V ISA manual starting from commit
-       58220614a5f ("Zimop is ratified/1.0").
+    supported as defined in the RISC-V ISA manual starting from commit
+    58220614a5f ("Zimop is ratified/1.0").
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZCA`: The Zca extension part of Zc* standard
-       extensions for code size reduction, as ratified in commit 8be3419c1c0
-       ("Zcf doesn't exist on RV64 as it contains no instructions") of
-       riscv-code-size-reduction.
+    extensions for code size reduction, as ratified in commit 8be3419c1c0
+    ("Zcf doesn't exist on RV64 as it contains no instructions") of
+    riscv-code-size-reduction.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZCB`: The Zcb extension part of Zc* standard
-       extensions for code size reduction, as ratified in commit 8be3419c1c0
-       ("Zcf doesn't exist on RV64 as it contains no instructions") of
-       riscv-code-size-reduction.
+    extensions for code size reduction, as ratified in commit 8be3419c1c0
+    ("Zcf doesn't exist on RV64 as it contains no instructions") of
+    riscv-code-size-reduction.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZCD`: The Zcd extension part of Zc* standard
-       extensions for code size reduction, as ratified in commit 8be3419c1c0
-       ("Zcf doesn't exist on RV64 as it contains no instructions") of
-       riscv-code-size-reduction.
+    extensions for code size reduction, as ratified in commit 8be3419c1c0
+    ("Zcf doesn't exist on RV64 as it contains no instructions") of
+    riscv-code-size-reduction.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZCF`: The Zcf extension part of Zc* standard
-       extensions for code size reduction, as ratified in commit 8be3419c1c0
-       ("Zcf doesn't exist on RV64 as it contains no instructions") of
-       riscv-code-size-reduction.
+    extensions for code size reduction, as ratified in commit 8be3419c1c0
+    ("Zcf doesn't exist on RV64 as it contains no instructions") of
+    riscv-code-size-reduction.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZCMOP`: The Zcmop May-Be-Operations extension is
-       supported as defined in the RISC-V ISA manual starting from commit
-       c732a4f39a4 ("Zcmop is ratified/1.0").
+    supported as defined in the RISC-V ISA manual starting from commit
+    c732a4f39a4 ("Zcmop is ratified/1.0").
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZAWRS`: The Zawrs extension is supported as
-       ratified in commit 98918c844281 ("Merge pull request #1217 from
-       riscv/zawrs") of riscv-isa-manual.
+    ratified in commit 98918c844281 ("Merge pull request #1217 from
+    riscv/zawrs") of riscv-isa-manual.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZAAMO`: The Zaamo extension is supported as
-       defined in the in the RISC-V ISA manual starting from commit e87412e621f1
-       ("integrate Zaamo and Zalrsc text (#1304)").
+    defined in the in the RISC-V ISA manual starting from commit e87412e621f1
+    ("integrate Zaamo and Zalrsc text (#1304)").
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZALASR`: The Zalasr extension is supported as
-       frozen at commit 194f0094 ("Version 0.9 for freeze") of riscv-zalasr.
+    frozen at commit 194f0094 ("Version 0.9 for freeze") of riscv-zalasr.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZALRSC`: The Zalrsc extension is supported as
-       defined in the in the RISC-V ISA manual starting from commit e87412e621f1
-       ("integrate Zaamo and Zalrsc text (#1304)").
+    defined in the in the RISC-V ISA manual starting from commit e87412e621f1
+    ("integrate Zaamo and Zalrsc text (#1304)").
 
   * :c:macro:`RISCV_HWPROBE_EXT_SUPM`: The Supm extension is supported as
-       defined in version 1.0 of the RISC-V Pointer Masking extensions.
+    defined in version 1.0 of the RISC-V Pointer Masking extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZFBFMIN`: The Zfbfmin extension is supported as
-       defined in the RISC-V ISA manual starting from commit 4dc23d6229de
-       ("Added Chapter title to BF16").
+    defined in the RISC-V ISA manual starting from commit 4dc23d6229de
+    ("Added Chapter title to BF16").
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVFBFMIN`: The Zvfbfmin extension is supported as
-       defined in the RISC-V ISA manual starting from commit 4dc23d6229de
-       ("Added Chapter title to BF16").
+    defined in the RISC-V ISA manual starting from commit 4dc23d6229de
+    ("Added Chapter title to BF16").
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVFBFWMA`: The Zvfbfwma extension is supported as
-       defined in the RISC-V ISA manual starting from commit 4dc23d6229de
-       ("Added Chapter title to BF16").
+    defined in the RISC-V ISA manual starting from commit 4dc23d6229de
+    ("Added Chapter title to BF16").
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZICBOM`: The Zicbom extension is supported, as
-       ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
+    ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZABHA`: The Zabha extension is supported as
-       ratified in commit 49f49c842ff9 ("Update to Rafified state") of
-       riscv-zabha.
+    ratified in commit 49f49c842ff9 ("Update to Rafified state") of
+    riscv-zabha.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZICBOP`: The Zicbop extension is supported, as
-       ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
+    ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZILSD`: The Zilsd extension is supported as
-       defined in the RISC-V ISA manual starting from commit f88abf1 ("Integrating
-       load/store pair for RV32 with the main manual") of the riscv-isa-manual.
+    defined in the RISC-V ISA manual starting from commit f88abf1 ("Integrating
+    load/store pair for RV32 with the main manual") of the riscv-isa-manual.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZCLSD`: The Zclsd extension is supported as
-       defined in the RISC-V ISA manual starting from commit f88abf1 ("Integrating
-       load/store pair for RV32 with the main manual") of the riscv-isa-manual.
+    defined in the RISC-V ISA manual starting from commit f88abf1 ("Integrating
+    load/store pair for RV32 with the main manual") of the riscv-isa-manual.
 
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns similar values to
-     :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
-     mistakenly classified as a bitmask rather than a value.
+  :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
+  mistakenly classified as a bitmask rather than a value.
 
 * :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`: An enum value describing
   the performance of misaligned scalar native word accesses on the selected set
@@ -326,7 +326,7 @@ The following keys are defined:
 * :c:macro:`RISCV_HWPROBE_KEY_TIME_CSR_FREQ`: Frequency (in Hz) of `time CSR`.
 
 * :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_VECTOR_PERF`: An enum value describing the
-     performance of misaligned vector accesses on the selected set of processors.
+  performance of misaligned vector accesses on the selected set of processors.
 
   * :c:macro:`RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN`: The performance of misaligned
     vector accesses is unknown.
@@ -348,7 +348,7 @@ The following keys are defined:
   * MIPS
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XMIPSEXECTL`: The xmipsexectl vendor
-        extension is supported in the MIPS ISA extensions spec.
+      extension is supported in the MIPS ISA extensions spec.
 
 * :c:macro:`RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0`: A bitmask containing the
   thead vendor extensions that are compatible with the
@@ -357,8 +357,8 @@ The following keys are defined:
   * T-HEAD
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR`: The xtheadvector vendor
-        extension is supported in the T-Head ISA extensions spec starting from
-	commit a18c801634 ("Add T-Head VECTOR vendor extension. ").
+      extension is supported in the T-Head ISA extensions spec starting from
+      commit a18c801634 ("Add T-Head VECTOR vendor extension. ").
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicbom block in bytes.
@@ -370,20 +370,20 @@ The following keys are defined:
   * SIFIVE
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCDOD`: The Xsfqmaccdod vendor
-        extension is supported in version 1.1 of SiFive Int8 Matrix Multiplication
-	Extensions Specification.
+      extension is supported in version 1.1 of SiFive Int8 Matrix Multiplication
+      Extensions Specification.
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCQOQ`: The Xsfqmaccqoq vendor
-        extension is supported in version 1.1 of SiFive Int8 Matrix Multiplication
-	Instruction Extensions Specification.
+      extension is supported in version 1.1 of SiFive Int8 Matrix Multiplication
+      Instruction Extensions Specification.
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFNRCLIPXFQF`: The Xsfvfnrclipxfqf
-        vendor extension is supported in version 1.0 of SiFive FP32-to-int8 Ranged
-	Clip Instructions Extensions Specification.
+      vendor extension is supported in version 1.0 of SiFive FP32-to-int8 Ranged
+      Clip Instructions Extensions Specification.
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ`: The Xsfvfwmaccqqq
-        vendor extension is supported in version 1.0 of Matrix Multiply Accumulate
-	Instruction Extensions Specification.
+      vendor extension is supported in version 1.0 of Matrix Multiply Accumulate
+      Instruction Extensions Specification.
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicbop block in bytes.

-- 
2.43.0

